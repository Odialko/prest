import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/routing/redirect.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/services/router_notifier.dart';
import 'package:prest/src/ui/common_widgets/placeholder_screen.dart';
import 'package:prest/src/ui/common_widgets/welcome_screen.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/offer_details/offer_details_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final routerListener = RouterNotifier(ref);

  // Функція для плавного переходу між сторінками
  CustomTransitionPage buildPage(Widget child, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  return GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    refreshListenable: routerListener,
    redirect: (context, state) => authRedirect(context, state, ref),
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            NavigationHubScreen.create(child: child),
        routes: [
          // 1. ГОЛОВНА (Welcome Screen)
          GoRoute(
            path: Routes.home,
            name: 'home',
            pageBuilder: (context, state) =>
                buildPage(const WelcomeScreen(), state),
          ),

          // 2. НЕРУХОМІСТЬ (Offers)
          GoRoute(
            path: Routes.offers,
            name: 'offers',
            pageBuilder: (context, state) {
              // Отримуємо тип з URL (напр. ?type=sale)
              final type = state.uri.queryParameters['type'];
              // Визначаємо, який NavItem передати в плейсхолдер
              NavItem item = NavItem.allProperties;
              if (type == 'sale') item = NavItem.sale;
              if (type == 'rent') item = NavItem.rent;
              if (type == 'off-market') item = NavItem.offMarket;

              return buildPage(PlaceholderScreen(item: item), state);
            },
            routes: [
              // Деталі пропозиції: /offers/123
              GoRoute(
                path: ':id',
                name: 'offer_details',
                pageBuilder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  final extraOffer = state.extra is OfferModel
                      ? state.extra as OfferModel
                      : null;
                  return buildPage(
                    OfferDetailsScreen(id: id, initialOffer: extraOffer),
                    state,
                  );
                },
              ),
            ],
          ),

          // 3. ПРО НАС ТА КОМАНДУ
          GoRoute(
            path: Routes.about,
            name: 'about',
            pageBuilder: (context, state) =>
                buildPage(const PlaceholderScreen(item: NavItem.about), state),
          ),
          GoRoute(
            path: Routes.team,
            name: 'team',
            pageBuilder: (context, state) =>
                buildPage(const PlaceholderScreen(item: NavItem.team), state),
          ),
          GoRoute(
            path: Routes.joinUs,
            name: 'joinUs',
            pageBuilder: (context, state) =>
                buildPage(const PlaceholderScreen(item: NavItem.joinUs), state),
          ),

          // 4. КОНТАКТИ
          GoRoute(
            path: Routes.contact,
            name: 'contact',
            pageBuilder: (context, state) => buildPage(
              const PlaceholderScreen(item: NavItem.contact),
              state,
            ),
          ),

          // 5. ПОСЛУГИ (Nested Routes)
          GoRoute(
            path: Routes.servicesDesign,
            name: 'design',
            pageBuilder: (context, state) =>
                buildPage(const PlaceholderScreen(item: NavItem.design), state),
          ),
          GoRoute(
            path: Routes.servicesCredit,
            name: 'credit',
            pageBuilder: (context, state) =>
                buildPage(const PlaceholderScreen(item: NavItem.credit), state),
          ),
          GoRoute(
            path: Routes.servicesAdvice,
            name: 'advice',
            pageBuilder: (context, state) =>
                buildPage(const PlaceholderScreen(item: NavItem.advice), state),
          ),
          GoRoute(
            path: Routes.servicesAbroad,
            name: 'abroad',
            pageBuilder: (context, state) =>
                buildPage(const PlaceholderScreen(item: NavItem.abroad), state),
          ),

          // // 6. ЮРИДИЧНИЙ БЛОК
          // GoRoute(
          //   path: Routes.legal,
          //   name: 'legal',
          //   pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.legal), state),
          //   routes: [
          //     GoRoute(
          //       path: 'privacy',
          //       name: 'privacy',
          //       pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.privacy), state),
          //     ),
          //     GoRoute(
          //       path: 'terms',
          //       name: 'terms',
          //       pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.terms), state),
          //     ),
          //   ],
          // ),
        ],
      ),
    ],
  );
});
