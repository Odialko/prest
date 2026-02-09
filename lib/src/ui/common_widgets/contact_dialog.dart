import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';

class PrestDialog extends StatelessWidget {
  final String title;
  const PrestDialog({super.key, required this.title});

  static Future<void> showContact(BuildContext context, {String title = 'Zgłoś poszukiwanie'}) {
    return showDialog(
      context: context,
      barrierColor: context.prestTheme.colors.chineseBlack.withOpacity(0.4),
      builder: (context) => PrestDialog(title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      backgroundColor: theme.colors.milk,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title.toUpperCase(), style: theme.blackTextTheme.font2.copyWith(letterSpacing: 3)),
                  const SizedBox(height: 50),
                  _buildField('Imię i Nazwisko*', theme),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildField('Nr telefonu*', theme)),
                      const SizedBox(width: 30),
                      Expanded(child: _buildField('Adres e-mail*', theme)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildField('Wiadomość', theme, isLong: true),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 220,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colors.gold,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text('WYŚLIJ', style: theme.whiteTextTheme.font6.copyWith(letterSpacing: 2)),
                    ),
                  )
                ],
              ),
            ),
            Positioned(right: 20, top: 20, child: IconButton(icon: const Icon(Icons.close, size: 28), onPressed: () => Navigator.pop(context))),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String hint, PrestThemeData theme, {bool isLong = false}) {
    return TextField(
      maxLines: isLong ? 4 : 1,
      decoration: InputDecoration(
        labelText: hint.toUpperCase(),
        labelStyle: theme.arsenicTextTheme.font9,
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.5)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: theme.colors.chineseBlack, width: 1.5)),
      ),
    );
  }
}