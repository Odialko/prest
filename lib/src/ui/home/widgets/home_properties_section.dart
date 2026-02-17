import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/generated/l10n.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/property_card.dart';
import 'package:prest/src/ui/home/store/home_store.dart';
import 'package:prest/src/routing/routes.dart';

class HomePropertiesSection extends ConsumerWidget {
  final bool isMobile;

  const HomePropertiesSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.prestTheme;
    final s = S.of(context);
    final offersState = ref.watch(homeProvider.select((s) => s.offersState));

    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: isMobile ? 60 : 120),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: LayoutsConstants.maxContentWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    s.homeOffersLabel.toUpperCase(),
                    style: theme.goldTextTheme.font7.copyWith(
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    s.homeOffersTitle.toUpperCase(),
                    style: theme.blackTextTheme.font1,
                  ),
                  const SizedBox(height: 80),

                  offersState.when(
                    init: () => const SizedBox.shrink(),
                    loading: () => _buildCustomLoadingGrid(),
                    error: (msg) => Center(
                      child: Text(
                        '${s.errorLoading}: $msg',
                        style: theme.blackTextTheme.font5,
                      ),
                    ),
                    loaded: (items) {
                      final limitedItems = items.take(6).toList();

                      return Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            cacheExtent: 1000,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isMobile ? 1 : 3,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 60,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: limitedItems.length,
                            itemBuilder: (context, index) {
                              return IndividualAnimatedCard(
                                index: index,
                                isMobile: isMobile,
                                child: PropertyCard(
                                  item: limitedItems[index],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 80),
                          PrestDarkBorderButton(
                            label: s.navAllProperties.toUpperCase(),
                            width: 300,
                            onPressed: () => context.goNamed(Routes.offers),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomLoadingGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 60,
        childAspectRatio: 0.7,
      ),
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

// --- АНІМОВАНА КАРТКА ---
class IndividualAnimatedCard extends StatefulWidget {
  final Widget child;
  final int index;
  final bool isMobile;

  const IndividualAnimatedCard({
    required this.child,
    required this.index,
    required this.isMobile,
    super.key,
  });

  @override
  State<IndividualAnimatedCard> createState() => _IndividualAnimatedCardState();
}

class _IndividualAnimatedCardState extends State<IndividualAnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('card-${widget.index}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_hasAnimated) {
          int delayFactor = widget.isMobile ? 0 : (widget.index % 3);
          Future.delayed(Duration(milliseconds: delayFactor * 100), () {
            if (mounted) {
              _controller.forward();
              setState(() => _hasAnimated = true);
            }
          });
        }
      },
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: SlideTransition(position: _offsetAnimation, child: widget.child),
      ),
    );
  }
}