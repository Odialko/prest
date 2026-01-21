import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';

class PremiumDrawer extends StatelessWidget {
  final PrestThemeData theme;

  const PremiumDrawer({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white.withValues(alpha: 0.95),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          children: [
            const SizedBox(height: 50),
            ...[
              NavItem.about,
              NavItem.sale,
              NavItem.design,
              NavItem.contact,
            ].map(
              (item) => ListTile(
                title: Center(
                  child: Text(item.title, style: theme.blackTextTheme.font6),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.go(item.route);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
