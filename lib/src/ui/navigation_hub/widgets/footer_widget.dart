import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    return Container(
      color: theme.colors.chineseBlack,
      padding: const EdgeInsets.all(80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('prEST © 2025', style: theme.whiteTextTheme.font5.copyWith(fontWeight: FontWeight.w700)),
              Row(
                children: [
                  _footerLink(theme, 'INSTAGRAM'),
                  _footerLink(theme, 'LINKEDIN'),
                  _footerLink(theme, 'CONTACT'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerLink(PrestThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(title, style: theme.whiteTextTheme.font6),
    );
  }
}