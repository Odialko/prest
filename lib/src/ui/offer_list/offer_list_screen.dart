// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:prest/src/prest_theme.dart';
// import 'package:prest/src/ui/common_widgets/property_card.dart';
// import 'package:prest/src/ui/offer_list/store/offer_list_store.dart';
// // Використовуємо нашу нову обгортку для скролу та футера
// import 'package:prest/src/ui/common_widgets/prest_page.dart';
//
// class OfferListScreen extends ConsumerStatefulWidget {
//   // ДОДАЄМО ПАРАМЕТР У КОНСТРУКТОР
//   final String? type;
//
//   const OfferListScreen({super.key, this.type});
//
//   @override
//   ConsumerState<OfferListScreen> createState() => _OfferListScreenState();
// }
//
// class _OfferListScreenState extends ConsumerState<OfferListScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     // Викликаємо завантаження даних відразу з фільтром, якщо він є
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (widget.type != null) {
//         // Тут логіка твого стора для фільтрації (наприклад, за типом)
//         // ref.read(offerListProvider.notifier).setType(widget.type);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(offerListProvider);
//     final theme = context.prestTheme;
//     final width = MediaQuery.of(context).size.width;
//
//     // Розрахунок кількості колонок залежно від ширини екрана
//     int crossAxisCount = 4;
//     if (width < 1200) crossAxisCount = 3;
//     if (width < 900) crossAxisCount = 2;
//     if (width < 600) crossAxisCount = 1;
//
//     // Використовуємо PrestPage, який ми створили раніше (він сам додасть скрол-лістенер та футер)
//     return PrestPage(
//       slivers: [
//         // 1. Відступ під прозорий AppBar
//         const SliverToBoxAdapter(child: SizedBox(height: 140)),
//
//         // 2. Заголовок
//         SliverToBoxAdapter(
//           child: Center(
//             child: Container(
//               constraints: const BoxConstraints(maxWidth: 1400),
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: _buildHeader(theme, widget.type ?? state.currentType),
//             ),
//           ),
//         ),
//
//         // 3. Сітка об'єктів
//         state.offersState.when(
//           loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
//           error: (e, stack) => SliverFillRemaining(child: Center(child: Text(e.toString()))),
//           loaded: (items) => SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//             sliver: SliverToBoxAdapter(
//               child: Center(
//                 child: Container(
//                   constraints: const BoxConstraints(maxWidth: 1400),
//                   child: GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount,
//                       crossAxisSpacing: 30,
//                       mainAxisSpacing: 30,
//                       childAspectRatio: 0.75, // Трохи підправив для високих карток
//                     ),
//                     itemCount: items.length,
//                     itemBuilder: (context, index) => PropertyCard(item: items[index], theme: theme),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           init: () => const SliverToBoxAdapter(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHeader(PrestThemeData theme, String? type) {
//     String title;
//     switch (type) {
//       case 'sale': title = 'SPRZEDAŻ'; break;
//       case 'rent': title = 'WYNAJEM'; break;
//       default: title = 'WSZYSTKIE OFERTY';
//     }
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'NIERUCHOMOŚCI',
//           style: theme.goldTextTheme.font7.copyWith(letterSpacing: 4),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           title,
//           style: theme.blackTextTheme.font1,
//         ),
//         const SizedBox(height: 20),
//         _buildFilters(context),
//       ],
//     );
//   }
//
//   Widget _buildFilters(BuildContext context) {
//     return Row(
//       children: [
//         _filterTab(context, 'WSZYSTKIE', null),
//         _filterTab(context, 'SPRZEDAŻ', 'sale'),
//         _filterTab(context, 'WYNAJEM', 'rent'),
//       ],
//     );
//   }
//
//   Widget _filterTab(BuildContext context, String label, String? typeValue) {
//     // Перевіряємо активний тип через параметр віджета або стан роутера
//     final bool isSelected = widget.type == typeValue;
//     final theme = context.prestTheme;
//
//     return Padding(
//       padding: const EdgeInsets.only(right: 30),
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         child: GestureDetector(
//           onTap: () {
//             if (typeValue == null) {
//               context.go('/offers');
//             } else {
//               context.go('/$typeValue'); // Перехід на prest.pl/sale або /rent
//             }
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 label,
//                 style: theme.blackTextTheme.font6.copyWith(
//                   fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                   color: isSelected ? Colors.black : Colors.grey,
//                   fontSize: 12,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 height: 2,
//                 width: isSelected ? 30 : 0,
//                 color: theme.colors.gold,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }