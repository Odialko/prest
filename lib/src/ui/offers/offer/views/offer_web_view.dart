import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:prest/src/ui/offers/offer/offer_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/constants/layouts_constants.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/scroll_reveal_box.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:prest/src/ui/common_widgets/contact_dialog.dart';
import 'package:prest/src/services/price_formater.dart';
import 'package:prest/src/ui/offers/offer/store/offer_store.dart';
import 'package:prest/src/providers/service_providers.dart';
import 'package:prest/src/models/offer_model.dart';

class OfferWebView extends ConsumerWidget implements OfferScreen {
  final int offerId;
  const OfferWebView({super.key, required this.offerId});

  void _openGallery(BuildContext context, List<String> images, int initialIndex) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Gallery',
      barrierColor: Colors.black.withValues(alpha: 0.9),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return FadeTransition(
          opacity: anim1,
          child: _GalleryViewer(images: images, initialIndex: initialIndex),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(offerProvider(offerId));
    final theme = context.prestTheme;
    final imageService = ref.watch(imageProcessorProvider);

    return state.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator(strokeWidth: 1))),
      error: (msg) => Scaffold(body: Center(child: Text('Error: $msg'))),
      loaded: (offer) {
        final allPictures = (offer.pictures ?? []).map((e) => imageService.getProcessedUrl(e)).toList();

        return SelectionArea(
          child: PrestPage(
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
                    child: LayoutBuilder(builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < LayoutsConstants.brakePointToMobile;
                      final px = isMobile ? LayoutsConstants.horizontalPaddingMobile : LayoutsConstants.horizontalPaddingDesktop;

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: px),
                        child: Column(
                          children: [
                            const SizedBox(height: 80),
                            // 1. HERO SECTION
                            _HeroSection(
                              offer: offer,
                              imageService: imageService,
                              theme: theme,
                              isMobile: isMobile,
                              onImageTap: () => _openGallery(context, allPictures, 0),
                            ),
                            const SizedBox(height: 100),

                            // 2. OPIS NIERUCHOMOŚCI
                            _buildDescription(offer, theme),
                            const SizedBox(height: 100),

                            // 3. GALERIA
                            if (allPictures.isNotEmpty)
                              ScrollRevealBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("GALERIA", style: theme.blackTextTheme.font4.copyWith(fontSize: 26, letterSpacing: 2)),
                                    const SizedBox(height: 40),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: isMobile ? 2 : 3,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        childAspectRatio: 1.5,
                                      ),
                                      itemCount: allPictures.length,
                                      itemBuilder: (context, index) => _HoverImage(
                                        image: allPictures[index],
                                        onTap: () => _openGallery(context, allPictures, index),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            const SizedBox(height: 100),
                            // 4. AGENT CARD
                            _buildAgentCard(context, offer, imageService, theme),
                            const SizedBox(height: 120),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescription(OfferModel o, theme) => ScrollRevealBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("OPIS NIERUCHOMOŚCI", style: theme.blackTextTheme.font4.copyWith(fontSize: 26, letterSpacing: 2)),
        const SizedBox(height: 40),
        HtmlWidget(o.description ?? '', textStyle: theme.blackTextTheme.font7.copyWith(fontSize: 17, height: 1.8)),
      ],
    ),
  );

  Widget _buildAgentCard(BuildContext context, OfferModel o, imageService, theme) {
    return ScrollRevealBox(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Container(
            padding: const EdgeInsets.all(50),
            color: const Color(0xFFF9F9F7),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: theme.colors.milk,
                  // Щоб обійти CORS у Flutter Web під час розробки,
                  // картинку краще додати в асети.
                  // Як швидкий фікс — використовуємо контейнер з Image.network,
                  // він іноді краще перетравлює рендерінг у вебі
                  child: ClipOval(
                    child: Image.network(
                      o.contactEmail?.toLowerCase().contains('iwona') == true
                          ? 'https://prestestate.pl/wp-content/uploads/2023/team/iwona.jpg'
                          : 'https://prestestate.pl/wp-content/uploads/2023/10/logo-gold.png',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.person, size: 60, color: theme.colors.gold),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(o.contactName?.toUpperCase() ?? 'EXPERTA PREST', textAlign: TextAlign.center, style: theme.blackTextTheme.font4.copyWith(fontSize: 22)),
                const SizedBox(height: 8),
                Text("EXPERT DS. NIERUCHOMOŚCI", style: TextStyle(color: theme.colors.gold, fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.bold)),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () => launchUrl(Uri.parse('tel:${o.contactPhone?.replaceAll(' ', '')}')),
                  child: Text(o.contactPhone ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => launchUrl(Uri.parse('mailto:${o.contactEmail}')),
                  child: Text(o.contactEmail ?? '', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6))),
                ),
                const SizedBox(height: 40),
                PrestDarkBorderButton(
                  label: "SKONTAKTUJ SIĘ",
                  onPressed: () => PrestDialog.showContact(context, title: 'KONTAKT: ${o.number}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatefulWidget {
  final OfferModel offer;
  final dynamic imageService;
  final dynamic theme;
  final bool isMobile;
  final VoidCallback onImageTap;
  const _HeroSection({required this.offer, required this.imageService, required this.theme, required this.isMobile, required this.onImageTap});

  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final o = widget.offer;
    final String mainImg = widget.imageService.getProcessedUrl(o.mainPicture ?? (o.pictures?.isNotEmpty == true ? o.pictures!.first : ''));
    final double price = double.tryParse(o.price?.toString() ?? '0') ?? 0;
    final double area = double.tryParse(o.areaTotal?.toString() ?? '0') ?? 0;
    final String priceM2 = area > 0 ? PriceFormatter.format(price / area) : '0';

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.black.withValues(alpha: 0.05))),
        child: widget.isMobile
            ? Column(children: [_buildPhoto(mainImg, true), _buildDetails(o, priceM2)])
            : IntrinsicHeight( // ЦЕЙ ВІДЖЕТ ПРИБИРАЄ БІЛІ СМУГИ (зрівнює висоту Row)
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ПРОПОРЦІЇ ЯК У СПИСКУ (6)
              Expanded(flex: 6, child: _buildPhoto(mainImg, false)),
              // ПРОПОРЦІЇ ЯК У СПИСКУ (4)
              Expanded(flex: 4, child: _buildDetails(o, priceM2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoto(String url, bool isMobile) {
    return GestureDetector(
      onTap: widget.onImageTap,
      child: SizedBox(
        height: isMobile ? 320 : double.infinity, // На десктопі висота підлаштовується під контент справа
        width: double.infinity,
        child: ClipRRect(
          child: AnimatedScale(
            scale: _hover ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 1200),
            child: Image.network(
              url,
              fit: BoxFit.cover, // ГАРАНТІЯ: жодних смуг, заповнює все
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(OfferModel o, String priceM2) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          color: const Color(0xFFEAE3D9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sprzedaż", style: widget.theme.blackTextTheme.font7.copyWith(fontSize: 14)),
              const SizedBox(height: 10),
              Text(PriceFormatter.format(o.price), style: widget.theme.blackTextTheme.font1.copyWith(fontSize: 32, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            children: [
              _row("CENA ZA M2", priceM2),
              _row("NIERUCHOMOŚĆ", o.typeName ?? "Mieszkanie"),
              _row("POWIERZCHNIA", "${o.areaTotal} m2"),
              _row("ROK BUDOWY", "${o.buildingYear ?? '-'}"),
              _row("RYNEK", o.market == 11 ? "Wtórny" : "Pierwotny"),
              _row("PIĘTRO", "${o.floor ?? '-'}"),
              _row("LICZBA POKOI", "${o.rooms ?? '-'}"),
              _row("LICZBA ŁAZIENEK", "${o.bathrooms ?? '1'}"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(String l, String v) => Container(
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(l, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0.5)),
      Text(v, style: const TextStyle(fontSize: 13.5)),
    ]),
  );
}

// ... _HoverImage та _GalleryViewer залишаються без змін ...

class _HoverImage extends StatefulWidget {
  final String image;
  final VoidCallback onTap;
  const _HoverImage({required this.image, required this.onTap});
  @override
  State<_HoverImage> createState() => _HoverImageState();
}

class _HoverImageState extends State<_HoverImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _scale = Tween<double>(begin: 1.0, end: 1.05).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ClipRRect(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ScaleTransition(scale: _scale, child: Image.network(widget.image, fit: BoxFit.cover)),
              AnimatedBuilder(animation: _controller, builder: (c, w) => Container(color: Colors.black.withValues(alpha: _controller.value * 0.1))),
            ],
          ),
        ),
      ),
    );
  }
}

class _GalleryViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  const _GalleryViewer({required this.images, required this.initialIndex});
  @override
  State<_GalleryViewer> createState() => _GalleryViewerState();
}

class _GalleryViewerState extends State<_GalleryViewer> {
  late PageController _controller;
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Scaffold(
        backgroundColor: Colors.black.withValues(alpha: 0.6),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('${_currentIndex + 1} / ${widget.images.length}', style: const TextStyle(color: Colors.white70)),
          actions: [IconButton(icon: const Icon(Icons.close, color: Colors.white, size: 30), onPressed: () => Navigator.pop(context)), const SizedBox(width: 20)],
        ),
        body: CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.arrowLeft): () => _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease),
            const SingleActivator(LogicalKeyboardKey.arrowRight): () => _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease),
          },
          child: Focus(
            autofocus: true,
            child: Stack(children: [
              PageView.builder(
                controller: _controller,
                itemCount: widget.images.length,
                onPageChanged: (i) => setState(() => _currentIndex = i),
                itemBuilder: (c, i) => InteractiveViewer(child: Center(child: Image.network(widget.images[i], fit: BoxFit.contain))),
              ),
              if (MediaQuery.of(context).size.width > 800) ...[
                _nav(true), _nav(false),
              ]
            ]),
          ),
        ),
      ),
    );
  }
  Widget _nav(bool left) => Positioned(
    left: left ? 20 : null, right: left ? null : 20, top: 0, bottom: 0,
    child: Center(child: IconButton(icon: Icon(left ? Icons.arrow_back_ios : Icons.arrow_forward_ios, color: Colors.white54, size: 40),
        onPressed: () => left ? _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease) : _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease))),
  );
}