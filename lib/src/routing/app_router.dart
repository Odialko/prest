import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/ui/home/home_screen.dart';
import 'package:prest/src/ui/navigation_hub/navigation_hub_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => NavigationHubScreen(child: child),
        routes: [
          // Головна
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          //
          // // Група: Про нас
          // GoRoute(
          //   path: Routes.about,
          //   builder: (context, state) => const AboutScreen(),
          // ),
          // GoRoute(
          //   path: Routes.team,
          //   builder: (context, state) => const TeamScreen(),
          // ),
          // GoRoute(
          //   path: Routes.joinUs,
          //   builder: (context, state) => const JoinUsScreen(),
          // ),
          //
          // // Група: Нерухомість
          // GoRoute(
          //   path: Routes.propertiesSale,
          //   builder: (context, state) => const PropertiesScreen(type: 'sale'),
          // ),
          // GoRoute(
          //   path: Routes.propertiesRent,
          //   builder: (context, state) => const PropertiesScreen(type: 'rent'),
          // ),
          // // Сторінка конкретного об'єкта
          // GoRoute(
          //   path: Routes.propertyDetails,
          //   builder: (context, state) {
          //     final id = state.pathParameters['id']!;
          //     return PropertyDetailsScreen(id: id);
          //   },
          // ),
          //
          // // Група: Послуги та Контакт
          // GoRoute(
          //   path: Routes.servicesDesign,
          //   builder: (context, state) => const DesignServiceScreen(),
          // ),
          // GoRoute(
          //   path: Routes.contact,
          //   builder: (context, state) => const ContactScreen(),
          // ),
        ],
      ),
    ],
  );
});
