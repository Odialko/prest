import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/layouts_constants.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/offers/offers_screen.dart';
import 'package:prest/src/ui/offers/store/offers_store.dart';
import 'package:prest/src/services/price_formater.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/providers/service_providers.dart';

class OffersWebView extends ConsumerStatefulWidget implements OffersScreen {
  const OffersWebView({super.key});

  @override
  ConsumerState<OffersWebView> createState() => _OffersWebViewState();
}

class _OffersWebViewState extends ConsumerState<OffersWebView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(offersProvider.notifier).fetchOffers());
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final state = ref.watch(offersProvider);

    return PrestPage(
      slivers: [
        // 1. HEADER
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 140),
              ScrollRevealBox(
                child: _buildHeader(theme),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),

        // 2. LIST OF PROPERTIES (Обмежений maxContentWidth)
        state.offersState.when(
          init: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator(strokeWidth: 1)),
          ),
          error: (msg) => SliverFillRemaining(
            child: Center(child: Text('Error: $msg')),
          ),
          loaded: (items) => SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: LayoutsConstants.maxContentWidth,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < LayoutsConstants.brakePointToMobile;
                    final horizontalPadding = isMobile
                        ? LayoutsConstants.horizontalPaddingMobile
                        : LayoutsConstants.horizontalPaddingDesktop;

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: ScrollRevealBox(
                            key: ValueKey('reveal-${item.id}'),
                            child: PrestPropertyRow(
                              key: ValueKey('property-${item.id}'),
                              offer: item,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        // 3. PAGINATION
        if (state.hasMore)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Center(
                child: state.isLoadingMore
                    ? const CircularProgressIndicator(strokeWidth: 1)
                    : PrestDarkBorderButton(
                  label: 'POKAŻ NASTĘPNE OFERTY',
                  width: 280,
                  onPressed: () => ref.read(offersProvider.notifier).loadMore(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHeader(PrestThemeData theme) {
    return Column(
      children: [
        Text(
          'PROPERTIES',
          textAlign: TextAlign.center,
          style: theme.blackTextTheme.font1.copyWith(
            letterSpacing: 25,
            fontWeight: FontWeight.w100,
            fontSize: 55,
          ),
        ),
        const SizedBox(height: 30),
        Container(height: 1, width: 80, color: theme.colors.gold),
      ],
    );
  }
}

class PrestPropertyRow extends ConsumerStatefulWidget {
  final OfferModel offer;
  const PrestPropertyRow({required this.offer, super.key});

  @override
  ConsumerState<PrestPropertyRow> createState() => _PrestPropertyRowState();
}

class _PrestPropertyRowState extends ConsumerState<PrestPropertyRow>
    with AutomaticKeepAliveClientMixin {
  bool _isHovered = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = context.prestTheme;
    final o = widget.offer;
    final imageService = ref.watch(imageProcessorProvider);

    final String? rawImage = (o.pictures != null && o.pictures!.isNotEmpty)
        ? o.pictures!.first
        : o.mainPicture;
    final String imageUrl = imageService.getProcessedUrl(rawImage);

    return LayoutBuilder(builder: (context, constraints) {
      final bool isMobile = constraints.maxWidth < LayoutsConstants.brakePointToMobile;

      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: Container(
          // На мобілці висота адаптивна, на десктопі — 520px
          height: isMobile ? null : 520,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.05)),
          ),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // PHOTO BLOCK
              Flexible(
                flex: isMobile ? 0 : 6,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
                child: SizedBox(
                  // Замість AspectRatio використовуємо SizedBox, щоб уникнути білих смуг
                  height: isMobile ? 320 : double.infinity,
                  width: double.infinity,
                  child: ClipRRect(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: AnimatedScale(
                            scale: _isHovered ? 1.05 : 1.0,
                            duration: const Duration(milliseconds: 1200),
                            curve: Curves.easeOutCubic,
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover, // ГАРАНТІЯ: жодних смуг
                              errorBuilder: (_, __, ___) => Container(color: theme.colors.milk),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: _buildBadge('${o.pictures?.length ?? 1} ZDJĘĆ'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // CONTENT BLOCK
              Flexible(
                flex: isMobile ? 0 : 4,
                fit: isMobile ? FlexFit.loose : FlexFit.tight,
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 30.0 : 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${o.cityName ?? 'WARSZAWA'} | ${o.districtName ?? ''}'.toUpperCase(),
                        style: theme.blackTextTheme.font7.copyWith(
                          letterSpacing: 3,
                          fontSize: 11,
                          color: theme.colors.gold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        (o.portalTitle ?? 'LUKSUSOWY APARTAMENT').toUpperCase(),
                        style: theme.blackTextTheme.font4.copyWith(
                          fontSize: isMobile ? 20 : 22,
                          height: 1.3,
                          fontWeight: FontWeight.w300,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        o.description ?? 'Prestiżowa oferta od prEST...',
                        style: theme.blackTextTheme.font7.copyWith(
                          fontSize: 14,
                          color: theme.colors.chineseBlack.withOpacity(0.6),
                          height: 1.6,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // На десктопі штовхаємо деталі вниз, на мобілці просто даємо відступ
                      if (!isMobile) const Spacer() else const SizedBox(height: 35),

                      Row(
                        children: [
                          _iconDetail(Icons.king_bed_outlined, '${o.rooms ?? 0} POKOJE'),
                          const SizedBox(width: 30),
                          _iconDetail(Icons.square_foot_outlined, '${_formatArea(o.areaTotal)} M²'),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const Divider(color: Colors.black12, height: 1),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            PriceFormatter.format(o.price),
                            style: theme.blackTextTheme.font5.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            transform: Matrix4.translationValues(_isHovered ? 8 : 0, 0, 0),
                            child: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: theme.colors.gold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      color: Colors.black.withOpacity(0.7),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _iconDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  String _formatArea(String? area) {
    if (area == null || area.isEmpty) return '0';
    final val = double.tryParse(area.replaceAll(RegExp(r'[^0-9.]'), ''));
    if (val == null) return area;
    return val.toStringAsFixed(val.truncateToDouble() == val ? 0 : 1);
  }
}