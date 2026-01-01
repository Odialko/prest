import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/ui/common_widgets/placeholder_screen.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // Функція для створення плавного переходу (Fade)
  CustomTransitionPage buildPageWithFade(Widget child) {
    return CustomTransitionPage(
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
        builder: (context, state, child) =>
            NavigationHubScreen.create(child: child),
        routes: [
          GoRoute(
            path: Routes.home,
            pageBuilder: (context, state) =>
                buildPageWithFade(HomeScreen.create()),
          ),
          // --- ГРУПА: PROEST ---
          GoRoute(
            path: Routes.about,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'O prEST')),
          ),
          GoRoute(
            path: Routes.team,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'Zespół')),
          ),
          GoRoute(
            path: Routes.joinUs,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(title: 'Dołącz do nas'),
            ),
          ),
          // --- ГРУПА: NIERUCHOMOŚCI ---
          GoRoute(
            path: Routes.propertiesSale,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'Sprzedaż')),
          ),
          GoRoute(
            path: Routes.propertiesRent,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'Wynajem')),
          ),
          GoRoute(
            path: Routes.propertiesOffMarket,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'OffMarket')),
          ),
          // --- ГРУПА: USŁUGI ---
          GoRoute(
            path: Routes.servicesDesign,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(title: 'prEST design'),
            ),
          ),
          GoRoute(
            path: Routes.servicesCredit,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(title: 'Kredyt'),
            ),
          ),
          GoRoute(
            path: Routes.servicesDoradztwo,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(title: 'Doradztwo'),
            ),
          ),
          GoRoute(
            path: Routes.servicesZaGranica,
            pageBuilder: (context, state) => buildPageWithFade(
              const PlaceholderScreen(title: 'Zakupy za granicą'),
            ),
          ),
          // Contact
          GoRoute(
            path: Routes.contact,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'Kontakt')),
          ),


          GoRoute(
            path: Routes.politykaPrywatnosci,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'Polityka prywatności')),
          ),
          GoRoute(
            path: Routes.regulamin,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'Regulamin')),
          ),
          GoRoute(
            path: Routes.cookies,
            pageBuilder: (context, state) =>
                buildPageWithFade(const PlaceholderScreen(title: 'Cookies')),
          ),
        ],
      ),
    ],
  );
});
