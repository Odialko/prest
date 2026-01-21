import 'package:flutter/material.dart';
import 'package:prest/src/constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Темно-синій фон
      backgroundColor: const Color(0xFF0B1D51),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Лого по центру
            // Image.asset(
            //   ImagesConstants.mainLogo, // <- поміняй на свій шлях до логотипу
            //   width: 200,
            //   height: 200,
            // ),
            // const SizedBox(height: 32),

            // Текст під лого
            const Text(
              'Projektujemy, budujemy…',
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            const Text(
              'Zapraszamy w lutym.',
              style: TextStyle(
                fontSize: 31,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
