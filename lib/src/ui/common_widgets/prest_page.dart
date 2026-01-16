import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/providers/scroll_provider.dart'; // Імпортуй свій новий провайдер
import 'package:prest/src/ui/navigation_hub/widgets/footer_widget.dart'; // Твій футер

class PrestPage extends ConsumerWidget {
  final List<Widget> slivers;
  final bool showFooter;

  const PrestPage({super.key, required this.slivers, this.showFooter = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0 &&
            notification is ScrollUpdateNotification) {
          ref.read(scrollPositionProvider.notifier).state =
              notification.metrics.pixels;
        }
        return true;
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          ...slivers,
          if (showFooter) const SliverToBoxAdapter(child: FooterWidget()),
        ],
      ),
    );
  }
}
