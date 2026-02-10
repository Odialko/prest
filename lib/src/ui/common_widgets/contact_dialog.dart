import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prest/src/prest_theme.dart';
import 'package:prest/src/routing/routes.dart';
import 'package:prest/src/ui/common_widgets/prest_checkbox.dart';

class PrestDialog extends StatefulWidget {
  final String title;
  final bool showWiadomosc;

  const PrestDialog({
    super.key,
    required this.title,
    this.showWiadomosc = true,
  });

  static Future<void> showContact(
      BuildContext context, {
        String title = 'Zgłoś poszukiwanie',
        bool showWiadomosc = true,
      }) {
    return showDialog(
      context: context,
      barrierColor: context.prestTheme.colors.chineseBlack.withValues(alpha: 0.6),
      builder: (context) => PrestDialog(title: title, showWiadomosc: showWiadomosc),
    );
  }

  @override
  State<PrestDialog> createState() => _PrestDialogState();
}

class _PrestDialogState extends State<PrestDialog> {
  bool _privacyAccepted = false;
  bool _marketingAccepted = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 60),
      backgroundColor: theme.colors.milk,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 30.0 : 60.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: theme.blackTextTheme.font2.copyWith(
                      letterSpacing: 3,
                      fontSize: isMobile ? 20 : 28,
                    ),
                  ),
                  const SizedBox(height: 50),
                  _buildField('Imię i Nazwisko*', theme),
                  const SizedBox(height: 20),
                  if (isMobile) ...[
                    _buildField('Nr telefonu*', theme),
                    const SizedBox(height: 20),
                    _buildField('Adres e-mail*', theme),
                  ] else
                    Row(
                      children: [
                        Expanded(child: _buildField('Nr telefonu*', theme)),
                        const SizedBox(width: 30),
                        Expanded(child: _buildField('Adres e-mail*', theme)),
                      ],
                    ),
                  if (widget.showWiadomosc) ...[
                    const SizedBox(height: 20),
                    _buildField('Wiadomość', theme, isLong: true),
                  ],
                  const SizedBox(height: 40),

                  // ВИКОРИСТАННЯ ЗАГАЛЬНИХ ВІДЖЕТІВ ЧЕКБОКСІВ
                  // У методі build класу _PrestDialogState
                  PrestCheckbox(
                    value: _privacyAccepted,
                    onChanged: (val) => setState(() => _privacyAccepted = val!),
                    label: TextSpan(
                      text: 'Akceptuję ',
                      style: theme.arsenicTextTheme.font9.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text: 'Politykę Prywatności*',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: theme.colors.chineseBlack,
                            fontWeight: FontWeight.bold,
                          ),
                          // Використовуємо контекст для навігації всередині додатку
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Закриваємо діалог перед переходом, щоб він не висів поверх нової сторінки
                              Navigator.pop(context);
                              // Переходимо на сторінку політики
                              context.go(Routes.privacyPolicy);
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  PrestCheckbox(
                    value: _marketingAccepted,
                    onChanged: (val) => setState(() => _marketingAccepted = val!),
                    label: const TextSpan(
                      text: 'Wyrażam zgodę na komunikację marketingową',
                    ),
                  ),

                  const SizedBox(height: 50),
                  _buildSubmitButton(theme),
                ],
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: const Icon(Icons.close, size: 28),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(PrestThemeData theme) {
    return SizedBox(
      width: 220,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colors.chineseBlack,
          foregroundColor: Colors.white,
          disabledBackgroundColor: theme.colors.chineseBlack.withValues(alpha: 0.3),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 0,
        ),
        // Кнопка активна тільки якщо прийнята політика
        onPressed: _privacyAccepted ? () => Navigator.pop(context) : null,
        child: Text(
          'WYŚLIJ',
          style: theme.whiteTextTheme.font6.copyWith(letterSpacing: 2),
        ),
      ),
    );
  }

  Widget _buildField(String hint, PrestThemeData theme, {bool isLong = false}) {
    return TextField(
      maxLines: isLong ? 4 : 1,
      style: theme.blackTextTheme.font7,
      decoration: InputDecoration(
        labelText: hint.toUpperCase(),
        labelStyle: theme.arsenicTextTheme.font9.copyWith(
          fontSize: 10,
          letterSpacing: 1.5,
        ),
        alignLabelWithHint: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colors.chineseBlack, width: 1.5),
        ),
      ),
    );
  }
}