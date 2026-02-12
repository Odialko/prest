import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Routing
import 'package:prest/src/routing/routes.dart';

// Screens
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import 'package:prest/src/ui/offers/offers_screen.dart';
import 'package:prest/src/ui/offers/offer/offer_screen.dart'; // Твій новий екран
import 'package:prest/src/ui/about/prest/about_prest_screen.dart';
import 'package:prest/src/ui/about/team/team_screen.dart';
import 'package:prest/src/ui/about/join_us/join_us_screen.dart';
import 'package:prest/src/ui/privacy_policy/privacy_policy_screen.dart';

// Services & Common
import 'package:prest/src/ui/common_widgets/placeholder_screen.dart';
import 'package:prest/src/ui/our_services/abroad/abroad_screen.dart';
import 'package:prest/src/ui/our_services/advice/advice_screen.dart';
import 'package:prest/src/ui/our_services/credit/credit_screen.dart';
import 'package:prest/src/ui/our_services/designe/design_screen.dart';
import 'package:prest/src/ui/our_services/for_developers/for_developers_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {

  // Універсальний хелпер для анімації переходів (Fade як на преміум сайтах)
  CustomTransitionPage _buildPage(Widget child, GoRouterState state) {
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
    debugLogDiagnostics: true, // Корисно для відладки в консолі
    routes: [
      ShellRoute(
        // NavigationHubScreen тримає AppBar/Footer для всіх сторінок
        builder: (context, state, child) => NavigationHubScreen(child: child),
        routes: [

          // --- HOME ---
          GoRoute(
            path: Routes.home,
            name: 'home',
            pageBuilder: (context, state) => _buildPage(HomeScreen.create(), state),
          ),

          // --- NIERUCHOMOŚCI (OFFERS) ---
          GoRoute(
            path: '/${Routes.offers}',
            name: Routes.offers,
            pageBuilder: (context, state) => _buildPage(OffersScreen(), state),
            routes: [
              GoRoute(
                path: ':id',
                name: 'offer',
                pageBuilder: (context, state) {
                  final idStr = state.pathParameters['id'] ?? '0';
                  final id = int.tryParse(idStr) ?? 0;
                  // Використовуємо фабрику OfferScreen, яку ми створили раніше
                  return _buildPage(OfferScreen(offerId: id), state);
                },
              ),
            ],
          ),

          // --- POZNAJ NAS (ABOUT) ---
          GoRoute(
            path: '/${Routes.about}',
            name: 'about',
            pageBuilder: (context, state) => _buildPage(AboutPrestScreen.create(), state),
          ),
          GoRoute(
            path: '/${Routes.team}',
            name: 'team',
            pageBuilder: (context, state) => _buildPage(TeamScreen.create(), state),
          ),
          GoRoute(
            path: '/${Routes.joinUs}',
            name: 'join-us',
            pageBuilder: (context, state) => _buildPage(JoinUsScreen.create(), state),
          ),

          // --- USŁUGI (SERVICES) ---
          GoRoute(
            path: '/${Routes.services}',
            name: 'services',
            pageBuilder: (context, state) => _buildPage(const PlaceholderScreen(item: NavItem.advice), state),
            routes: [
              GoRoute(
                path: Routes.forDevelopers,
                name: 'for-developers',
                pageBuilder: (context, state) => _buildPage(ForDevelopersScreen(), state),
              ),
              GoRoute(
                path: Routes.servicesDesign,
                name: 'service-design',
                pageBuilder: (context, state) => _buildPage(DesignScreen.create(), state),
              ),
              GoRoute(
                path: Routes.servicesCredit,
                name: 'service-credit',
                pageBuilder: (context, state) => _buildPage(CreditScreen.create(), state),
              ),
              GoRoute(
                path: Routes.servicesAdvice,
                name: 'service-advice',
                pageBuilder: (context, state) => _buildPage(AdviceScreen.create(), state),
              ),
              GoRoute(
                path: Routes.servicesAbroad,
                name: 'service-abroad',
                pageBuilder: (context, state) => _buildPage(AbroadScreen.create(), state),
              ),
            ],
          ),

          // --- LEGAL & CONTACT ---
          GoRoute(
            path: Routes.privacyPolicy,
            name: 'privacy-policy',
            pageBuilder: (context, state) => _buildPage(PrivacyPolicyScreen(), state),
          ),
          GoRoute(
            path: '/${Routes.contact}',
            name: 'contact',
            pageBuilder: (context, state) => _buildPage(const PlaceholderScreen(item: NavItem.contact), state),
          ),
        ],
      ),
    ],
  );
});