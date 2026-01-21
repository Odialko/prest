import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/ui/navigation_hub/models/navigation_items.dart';
import 'contact_dialog.dart';

class NavCtaButton extends StatelessWidget {
  final NavItem item;
  final PrestThemeData theme;
  final bool isOutlined;
  final bool isDialog;

  const NavCtaButton({
    super.key,
    required this.item,
    required this.theme,
    this.isOutlined = false,
    this.isDialog = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => isDialog
          ? ContactDialog.show(context, theme)
          : context.go(item.route),
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined
            ? theme.colors.milk
            : theme.colors.chineseBlack,
        foregroundColor: isOutlined ? theme.colors.chineseBlack : Colors.white,
        side: BorderSide(color: theme.colors.chineseBlack),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        elevation: 0,
      ),
      child: Text(
        item.title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
