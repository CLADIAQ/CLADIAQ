import 'dart:developer';

import 'package:cladiaq/commons/colors.dart';
import 'package:cladiaq/home/home_view.dart';
import 'package:cladiaq/login/login_view.dart';
import 'package:cladiaq/onboarding/onboarding_view.dart';
import 'package:cladiaq/settings/settings_page.dart';
import 'package:cladiaq/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? true;
  log(onboarding.toString());
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({Key? key, required this.onboarding}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: cqPrimaryColor,
            ),
      ),
      routes: {
        "/": (context) => onboarding ? const OnboardingView() : const LogIn(),
        "/dashboard": (context) => const HomePage(),
        "/news": (context) => SensorDataPage(),
        "/ai": (context) => SensorDataPage(),
        "/settings": (context) => const SettingsPage(),
      },
    );
  }
}
