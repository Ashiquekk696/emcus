import 'package:emcus/modules/bottom_bar/view/pages/bottom_bar_screen.dart';
import 'package:emcus/modules/auth/view/pages/login_screen.dart';
import 'package:emcus/modules/auth/view/pages/register_screen.dart';
import 'package:flutter/material.dart';

/// Centralized route names and generation logic.
class Routes {
  /// Route names
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String home = '/home';

  /// Generate routes dynamically
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signUp:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case home:
        return MaterialPageRoute(builder: (_) => const BottomBarScreen());
      // case productListingBasedOnCategory:
      //   final argument = settings.arguments as ProductListingByCategoryArgument;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductListingByCategoryScreen(
      //       argument: argument,
      //     ),
      //   );
    }
    return null;
  }
}
