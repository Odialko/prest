import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/routing/redirect.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/services/router_notifier.dart';
import 'package:prest/src/ui/common_widgets/placeholder_screen.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final routerListener = RouterNotifier(ref);

  // Helper function for smooth Fade transition between screens
  CustomTransitionPage buildPageWithFade(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 800),
    );
  }

  return GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    refreshListenable: routerListener,
    redirect: (context, state) => authRedirect(context, state, ref),
    // errorBuilder: (_, state) => ErrorScreen(errorText: state.error.toString()),
    routes: [
      ShellRoute(
        builder: (context, state, child) =>
            NavigationHubScreen.create(child: child),
        routes: [
          // --- HOME SCREEN ---
          GoRoute(
            path: Routes.home,
            pageBuilder: (context, state) =>
                buildPageWithFade(HomeScreen.create()),
          ),

          // --- GROUP: ABOUT US (POZNAJ NAS) ---
          GoRoute(
            path: Routes.about,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(item: NavItem.about)),
          ),
          GoRoute(
            path: Routes.team,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(item: NavItem.team)),
          ),
          GoRoute(
            path: Routes.joinUs,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.joinUs),
            ),
          ),

          // --- GROUP: PROPERTIES (NIERUCHOMOŚCI) ---
          GoRoute(
            path: Routes.propertiesSale,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(item: NavItem.sale)),
          ),
          GoRoute(
            path: Routes.propertiesRent,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(item: NavItem.rent)),
          ),
          GoRoute(
            path: Routes.propertiesOffMarket,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.offMarket),
            ),
          ),

          // --- GROUP: SERVICES (USŁUGI) ---
          GoRoute(
            path: Routes.servicesDesign,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.design),
            ),
          ),
          GoRoute(
            path: Routes.servicesCredit,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.credit),
            ),
          ),
          GoRoute(
            path: Routes.servicesDoradztwo,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.advice),
            ),
          ),
          GoRoute(
            path: Routes.servicesZaGranica,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.abroad),
            ),
          ),

          // --- CONTACT ---
          GoRoute(
            path: Routes.contact,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.contact),
            ),
          ),

          // --- LEGAL (Static Titles for now or add to NavItem if needed) ---
          GoRoute(
            path: Routes.politykaPrywatnosci,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(item: NavItem.about),
            ), // Or specific NavItem
          ),
          GoRoute(
            path: Routes.regulamin,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(item: NavItem.about)),
          ),
          GoRoute(
            path: Routes.cookies,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(item: NavItem.about)),
          ),
        ],
      ),
    ],
  );
});
