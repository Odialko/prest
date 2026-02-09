import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/providers/scroll_provider.dart';
import 'package:prest/src/ui/navigation_hub/widgets/footer_widget.dart';

class PrestPage extends ConsumerStatefulWidget {
  final List<Widget> slivers;
  final bool showFooter;
  final bool resetScrollOnBuild; // Чи скидати скрол при відкритті сторінки

  const PrestPage({
    super.key,
    required this.slivers,
    this.showFooter = true,
    this.resetScrollOnBuild = true,
  });

  @override
  ConsumerState<PrestPage> createState() => _PrestPageState();
}

class _PrestPageState extends ConsumerState<PrestPage> {
  @override
  void initState() {
    super.initState();
    if (widget.resetScrollOnBuild) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(scrollPositionProvider.notifier).state = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0) {
          ref.read(scrollPositionProvider.notifier).state = notification.metrics.pixels;
        }
        return true;
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 80), // 40 (topbar) + 100 (header)
          ),

          ...widget.slivers,

          if (widget.showFooter)
            const SliverToBoxAdapter(child: FooterWidget()),
        ],
      ),
    );
  }
}