import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/Login/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/Register/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/splash_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/string_manager.dart';


class RoutesManager {
  static const String registerRoute = '/register';
  static const String loginRoute = '/login';
  static const String profileRoute = '/profile';
}

class AppRouter {
  static Route<dynamic> getRoutes (RouteSettings settings)
  {
    switch (settings.name)
    {
      case RoutesManager.registerRoute :
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RoutesManager.loginRoute :
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesManager.profileRoute :
        return MaterialPageRoute(builder: (_) => const UserProfile());
      default :
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute (){
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.undefinedRoute,
        ),
      ),
      body: const Center(
        child: Text(
          AppStrings.undefinedRoute,
        ),
      ),
    ));

  }
}