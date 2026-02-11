import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prest/src/constants/constants.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/common_widgets/prest_page.dart';
import 'package:prest/src/ui/common_widgets/property_card.dart';
import 'package:prest/src/ui/common_widgets/prest_buttons.dart'; // Твої фірмові кнопки
import 'package:prest/src/ui/offers/offers_screen.dart';
import 'package:prest/src/ui/offers/store/offers_store.dart'; // Твій новий стор

class OffersMobileView extends ConsumerStatefulWidget implements OffersScreen {
  const OffersMobileView({super.key});

  @override
  ConsumerState<OffersMobileView> createState() => _OffersMobileViewState();
}

class _OffersMobileViewState extends ConsumerState<OffersMobileView> {
  @override
  void initState() {
    super.initState();
    // Виправляємо на актуальний offersProvider
    Future.microtask(() => ref.read(offersProvider.notifier).fetchOffers());
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final state = ref.watch(offersProvider); // Змінено з offerListProvider

    return PrestPage(
      slivers: [
        // 1. HEADER (Мобільний стиль)
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                'PROPERTIES',
                style: theme.blackTextTheme.font1.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),

        // 2. CONTENT STATE
        state.offersState.when(
          init: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator(color: Colors.black)),
          ),
          error: (msg) => SliverFillRemaining(
            child: Center(child: Text('Error: $msg', style: theme.blackTextTheme.font5)),
          ),
          loaded: (items) => SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: LayoutsConstants.maxContentWidth),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 60,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) => PropertyCard(item: items[index]),
                      ),

                      // --- ПАГІНАЦІЯ ТУТ ---
                      const SizedBox(height: 80),
                      if (state.hasMore)
                        state.isLoadingMore
                            ? const CircularProgressIndicator(color: Colors.black)
                            : PrestDarkBorderButton(
                          label: 'POKAŻ NASTĘPNE 10 OFERT',
                          width: 280,
                          onPressed: () => ref.read(offersProvider.notifier).loadMore(),
                        )
                      else if (items.isNotEmpty)
                        _EndOfListIndicator(), // Виніс у окремий віджет нижче

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // 3. ПАГІНАЦІЯ (Кнопка внизу)
        if (state.hasMore && state.offersState is OffersStateLoaded)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: state.isLoadingMore
                    ? const CircularProgressIndicator(color: Colors.black)
                    : PrestDarkBorderButton( // Використовуємо твою чорну кнопку
                  label: 'POKAŻ WIĘCEJ',
                  width: MediaQuery.of(context).size.width - 40, // На всю ширину мобілки
                  onPressed: () => ref.read(offersProvider.notifier).loadMore(),
                ),
              ),
            ),
          ),

        // Відступ внизу, щоб список не "прилипав" до краю
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }
}


class _EndOfListIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    return Column(
      children: [
        Container(width: 40, height: 1, color: Colors.black.withValues(alpha: 0.2)),
        const SizedBox(height: 20),
        Text(
          'TO JUŻ WSZYSTKIE OFERTY',
          style: theme.blackTextTheme.font7.copyWith(
            color: Colors.black45,
            letterSpacing: 2,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}