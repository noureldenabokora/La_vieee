import 'package:flutter/material.dart';
import 'package:la_vie/presentation/forget_password/forget_password_view.dart';
import 'package:la_vie/presentation/login/login_view.dart';
import 'package:la_vie/presentation/register/register_view.dart';
import 'package:la_vie/presentation/resources/strings_manager.dart';
import 'package:la_vie/presentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String onBoardingRoute = '/onBoarding';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String stroeDetailsRoute = '/stroeDetails';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

      default:
        return unDefindeRoute();
    }
  }

  static Route<dynamic> unDefindeRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.unDifienedRoute),
        ),
        body: const Center(child: Text(AppStrings.unDifienedRoute)),
      ),
    );
  }
}
