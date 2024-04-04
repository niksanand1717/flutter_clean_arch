import 'package:clean_arch/presentation/forgot_password/forgot_password.dart';
import 'package:clean_arch/presentation/login/login.dart';
import 'package:clean_arch/presentation/main/main_view.dart';
import 'package:clean_arch/presentation/onboarding/onboarding.dart';
import 'package:clean_arch/presentation/register/register.dart';
import 'package:clean_arch/presentation/resources/strings_manager.dart';
import 'package:clean_arch/presentation/resources/strings_manager.dart';
import 'package:clean_arch/presentation/splash/splash.dart';
import 'package:clean_arch/presentation/store_details/store_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.noRouteFound),
      ),
      body: Center(
        child: Text(AppStrings.noRouteFound),
      ),
    ),
  );
}
