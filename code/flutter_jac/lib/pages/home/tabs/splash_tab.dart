// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';

import 'package:flutter_jac/utils/screen_utils.dart' as ScreenUtils;

class SplashTab extends StatelessWidget {
  const SplashTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/splash.png",
                width: ScreenUtils.getScreenWidth(context) * .7,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 48),
                child: Text(
                  "Jobs Academy App",
                  style: textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "JAC Offre percorsi nell'ambito dell’istruzione post-diploma"
                  " per formare tecnici specializzati in ambito Business, Tecnologico,"
                  " ICT, Marketing e Green.",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Benvenuti"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
