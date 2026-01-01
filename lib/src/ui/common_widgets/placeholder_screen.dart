import 'package:flutter/material.dart';
import 'package:prest/src/prest_theme.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.prestTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // Контейнер на весь екран мінус висота хедера (приблизно 120)
      constraints: BoxConstraints(minHeight: screenHeight - 200),
      width: double.infinity,
      color: theme.colors.white,
      // Додаємо відступ зверху, щоб хедер не наповзав на текст
      padding: const EdgeInsets.only(top: 150, bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Декоративна лінія зверху
          Container(width: 40, height: 1, color: theme.colors.gold),
          const SizedBox(height: 40),

          // ВЕЛИКИЙ ЗАГОЛОВОК
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.blackTextTheme.font1.copyWith( // Змінено на font1 для масштабу
              letterSpacing: 12,
              fontWeight: FontWeight.w300,
              fontSize: 48, // Примусовий великий розмір, якщо font1 малий
            ),
          ),

          const SizedBox(height: 20),

          // ПІДЗАГОЛОВОК
          Text(
            "STAY TUNED • prEST",
            style: theme.blackTextTheme.font7.copyWith(
              color: theme.colors.gold,
              letterSpacing: 4,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 60),
          // Декоративна лінія знизу
          Container(width: 40, height: 1, color: theme.colors.gold),
        ],
      ),
    );
  }
}