import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';

class PrestDialogs {
  static void showContact(BuildContext context) {
    final theme = context.prestTheme;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Contact',
      barrierColor: Colors.black.withValues(alpha: 0.8),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) => Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: anim1,
            child: Container(
              width: 450,
              padding: const EdgeInsets.all(60),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'UMÓW ROZMOWĘ',
                    style: theme.blackTextTheme.font4.copyWith(
                      letterSpacing: 4,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildField(theme, 'Imię i Nazwisko'),
                  const SizedBox(height: 20),
                  _buildField(theme, 'Numer telefonu / Email'),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colors.chineseBlack,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text('WYŚLIJ', style: theme.whiteTextTheme.font7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildField(PrestThemeData theme, String hint) {
    return TextField(
      style: theme.blackTextTheme.font6,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.grayTextTheme.font7,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}