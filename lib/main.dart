import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart' show AppTheme;
import 'features/auth/presentation/screens/onBoarding_view.dart' show OnboardingView;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:AppTheme.lightTheme,

      home: const OnboardingView(),
    );
  }
}
