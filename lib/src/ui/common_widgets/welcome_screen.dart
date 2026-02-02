import 'package:flutter/material.dart';
import 'package:prest/src/constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Głęboki granatowy kolor tła
      backgroundColor: const Color(0xFF0B1D51),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo (jeśli chcesz je odkomentować w przyszłości)
              // Image.asset(
              //   ImagesConstants.mainLogo,
              //   width: 250,
              //   height: 100,
              //   fit: BoxFit.contain,
              // ),
              // const SizedBox(height: 48),

              // GŁÓWNE HASŁO
              const Text(
                'Tworzymy miejsce dla dobrych adresów.',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w300, // Lżejsza waga dodaje elegancji
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // DATA OTWARCIA
              const Text(
                'Zapraszamy za kilka dni.',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // KONTAKT
              const Text(
                'Chcesz się z nami skontaktować już teraz?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // NUMER TELEFONU (Wyróżniony na biało)
              const Text(
                '+48 690 175 317',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
