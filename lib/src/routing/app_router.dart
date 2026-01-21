import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/models/offer_model.dart';
import 'package:prest/src/routing/redirect.dart';
import 'package:prest/src/services/router_notifier.dart';
import 'package:prest/src/ui/common_widgets/placeholder_screen.dart';
import 'package:prest/src/ui/common_widgets/welcome_screen.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/offer_details/offer_details_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final routerListener = RouterNotifier(ref);

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
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: routerListener,
    redirect: (context, state) => authRedirect(context, state, ref),
    routes: [
      ShellRoute(
        builder: (context, state, child) => NavigationHubScreen.create(child: child),
        routes: [

          // 1. ГОЛОВНА: prest.pl/
          // GoRoute(
          //   path: '/',
          //   name: 'home',
          //   pageBuilder: (context, state) => buildPage(HomeScreen.create(), state),
          // ),
          GoRoute(
            path: '/',
            name: 'welcome',
            pageBuilder: (context, state) => buildPage(WelcomeScreen(), state),
          ),

          // 2. НЕРУХОМІСТЬ: prest.pl/offers
          GoRoute(
            path: '/offers',
            name: 'offers',
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.allProperties), state),
            routes: [
              // ДЕТАЛІ: prest.pl/offers/id_123
              GoRoute(
                path: ':id',
                name: 'offer_details',
                pageBuilder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  final extraOffer = state.extra is OfferModel ? state.extra as OfferModel : null;
                  return buildPage(OfferDetailsScreen(id: id, initialOffer: extraOffer), state);
                },
              ),
            ],
          ),

          // 3. ПРЯМІ КАТЕГОРІЇ (SEO): prest.pl/sale та prest.pl/rent
          GoRoute(
            path: '/sale',
            name: 'sale',
            // pageBuilder: (context, state) => buildPage(const OfferListScreen(type: 'sale'), state),
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.allProperties), state),
          ),
          GoRoute(
            path: '/rent',
            name: 'rent',
            // pageBuilder: (context, state) => buildPage(const OfferListScreen(type: 'rent'), state),
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.rent), state),
          ),

          // 4. КОМПАНІЯ: prest.pl/about, prest.pl/team
          GoRoute(
            path: '/about',
            name: 'about',
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.about), state),
          ),
          GoRoute(
            path: '/team',
            name: 'team',
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.team), state),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.contact), state),
          ),

          // 5. ПОСЛУГИ: prest.pl/services/design
          GoRoute(
            path: '/services',
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.advice), state),
            routes: [
              GoRoute(path: 'design', pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.design), state)),
              GoRoute(path: 'credit', pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.credit), state)),
              GoRoute(path: 'advice', pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.advice), state)),
            ],
          ),

          // 6. ЮРИДИЧНИЙ БЛОК: prest.pl/legal/privacy
          GoRoute(
            path: '/legal',
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.about), state),
            routes: [
              GoRoute(path: 'privacy', pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.about), state)),
              GoRoute(path: 'terms', pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.about), state)),
            ],
          ),
        ],
      ),
    ],
  );
});