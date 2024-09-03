import 'package:cladiaq/login/login_view.dart';
import 'package:cladiaq/onboarding/onboarding_view.dart';
import 'package:cladiaq/signup/signup_view.dart';
import 'package:cladiaq/welcome/welcome.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LogIn());
      case '/register':
        return MaterialPageRoute(builder: (_) => SignUp());
      default:
        return null;
    }
  }
}
