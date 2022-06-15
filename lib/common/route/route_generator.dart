import 'package:adams_land/feature/signin_signup/ui/screen/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adams_land/feature/landing/landing_page.dart';
import 'package:adams_land/feature/signin_signup/resources/auth_repository.dart';

import '../../feature/signin_signup/ui/screen/sign_in_page.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());

      case Routes.signIn:
        if (args is AuthRepository) {
          return MaterialPageRoute<dynamic>(
              builder: (_) => SignInPage(authRepository: args));
        }

        return _errorRoute();

      case Routes.signUp:
        if (args is AuthRepository) {
          return MaterialPageRoute<dynamic>(
              builder: (_) => SignUpPage(authRepository: args));
        }

        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
