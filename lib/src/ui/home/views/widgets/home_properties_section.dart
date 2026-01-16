import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/property_card.dart';
import 'package:prest/src/ui/home/store/home_store.dart';
import 'package:prest/src/routing/routes.dart';

class HomePropertiesSection extends ConsumerWidget {
  final bool isMobile;
  final PrestThemeData theme;

  const HomePropertiesSection({
    super.key,
    required this.isMobile,
    required this.theme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    'SPECIAL OFFERS',
                    style: theme.goldTextTheme.font7.copyWith(
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text('PROPERTIES', style: theme.blackTextTheme.font1),
                  const SizedBox(height: 80),

                  offersState.when(
                    init: () => const SizedBox.shrink(),
                    loading: () => _buildCustomLoadingGrid(),
                    error: (msg) => Center(
                      child: Text(
                        'Error: $msg',
                        style: theme.blackTextTheme.font5,
                      ),
                    ),
                    loaded: (items) {
                      final limitedItems = items.take(9).toList();

                      return Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
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
                                  theme: theme,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 80),
                          _ViewAllAnimatedButton(theme: theme),
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
      itemBuilder: (context, index) => Container(), // Скелетон
    );
  }
}

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
      duration: const Duration(milliseconds: 1000),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );
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
        if (info.visibleFraction > 0.2 && !_hasAnimated) {
          // Додаємо невелику затримку для "каскадного" ефекту в ряду
          // Якщо це десктоп (3 в ряду), то картки в одному ряду виїдуть почергово
          // index % 3 дасть 0, 1, 2 для кожного ряду.
          int delayFactor = widget.isMobile ? 0 : (widget.index % 3);

          Future.delayed(Duration(milliseconds: delayFactor * 150), () {
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

class _ViewAllAnimatedButton extends StatefulWidget {
  final PrestThemeData theme;
  const _ViewAllAnimatedButton({required this.theme});

  @override
  State<_ViewAllAnimatedButton> createState() => _ViewAllAnimatedButtonState();
}

class _ViewAllAnimatedButtonState extends State<_ViewAllAnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    const String buttonText = 'SEE ALL PROPERTIES';
    const Duration duration = Duration(milliseconds: 400);
    const Curve curve = Curves.easeInOutCubic;
    const double buttonWidth = 280;

    return SelectionContainer.disabled(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => context.goNamed(Routes.offers),
          child: Container(
            width: buttonWidth,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.8),
            ),
            child: Stack(
              children: [
                // 1. БІЛИЙ ШАР (Зменшується, "тікає" вправо)
                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: duration,
                    curve: curve,
                    width: _isHovered ? 0 : buttonWidth,
                    height: 60,
                    clipBehavior: Clip.hardEdge,
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            buttonText,
                            maxLines: 1, // Додаємо для безпеки
                            style: widget.theme.blackTextTheme.font7.copyWith(
                              letterSpacing: 2.5,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis, // ПОВЕРНУВ
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // 2. ЧОРНИЙ ШАР (Розширюється, "наїжджає" зліва)
                Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: duration,
                    curve: curve,
                    width: _isHovered ? buttonWidth : 0,
                    height: 60,
                    clipBehavior: Clip.hardEdge,
                    color: Colors.black,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: buttonWidth,
                        child: Center(
                          child: Text(
                            buttonText,
                            maxLines: 1,
                            style: widget.theme.blackTextTheme.font7.copyWith(
                              letterSpacing: 2.5,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis, // ПОВЕРНУВ
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
