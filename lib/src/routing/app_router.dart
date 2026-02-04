import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/ui/about/join_us/join_us_screen.dart';
import 'package:prest/src/ui/about/prest/about_prest_screen.dart';
import 'package:prest/src/ui/about/team/team_screen.dart';
import 'package:prest/src/ui/common_widgets/placeholder_screen.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/offer_details/offer_details_screen.dart';
import 'package:prest/src/ui/our_services/abroad/abroad_screen.dart';
import 'package:prest/src/ui/our_services/advice/advice_screen.dart';
import 'package:prest/src/ui/our_services/credit/credit_screen.dart';
import 'package:prest/src/ui/our_services/designe/design_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // final routerListener = RouterNotifier(ref);

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
    routes: [
      ShellRoute(
        builder: (context, state, child) => NavigationHubScreen.create(child: child),
        routes: [
          GoRoute(path: Routes.home, name: 'home', pageBuilder: (context, state) => buildPage(HomeScreen.create(), state)),

          // NIERUCHOMOŚCI
          GoRoute(
            path: '/${Routes.offers}',
            name: Routes.offers,
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.allProperties), state),
            routes: [
              GoRoute(
                path: ':id',
                name: 'offer_details',
                pageBuilder: (context, state) => buildPage(OfferDetailsScreen(id: state.pathParameters['id'] ?? ''), state),
              ),
            ],
          ),

          // POZNAJ NAS
          // GoRoute(path: '/${Routes.about}', pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.about), state)),
          GoRoute(path: '/${Routes.about}', pageBuilder: (context, state) => buildPage(AboutPrestScreen.create(), state)),
          GoRoute(path: '/${Routes.team}', pageBuilder: (context, state) => buildPage(TeamScreen.create(), state)),
          GoRoute(path: '/${Routes.joinUs}', pageBuilder: (context, state) => buildPage(JoinUsScreen.create(), state)),
          GoRoute(path: '/${Routes.contact}', pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.contact), state)),

          // USŁUGI
          GoRoute(
            path: '/${Routes.services}',
            pageBuilder: (context, state) => buildPage(const PlaceholderScreen(item: NavItem.advice), state),
            routes: [
              GoRoute(path: Routes.servicesDesign, pageBuilder: (context, state) => buildPage(DesignScreen.create(), state)),
              GoRoute(path: Routes.servicesCredit, pageBuilder: (context, state) => buildPage(CreditScreen.create(), state)),
              GoRoute(path: Routes.servicesAdvice, pageBuilder: (context, state) => buildPage(AdviceScreen.create(), state)),
              GoRoute(path: Routes.servicesAbroad, pageBuilder: (context, state) => buildPage(AbroadScreen.create(), state)),
            ],
          ),
        ],
      ),
    ],
  );
});
