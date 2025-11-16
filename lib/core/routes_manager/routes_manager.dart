import 'package:evently/feature/auth/login/login.dart';
import 'package:evently/feature/auth/register/register.dart';
import 'package:evently/feature/create_event/create_event.dart';
import 'package:evently/feature/main_layout/main_layout.dart';
import 'package:flutter/cupertino.dart';

abstract class RoutesManager {
  static const String register = "/register";
  static const String login = "/login";
  static const String mainlayout = "/mainlayout";
  static const String createEvent = "/createEvent";

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return CupertinoPageRoute(builder: (context) => Register());
      case login:
        return CupertinoPageRoute(builder: (context) => Login());
      case mainlayout:
        return CupertinoPageRoute(builder: (context) => MainLayout());
      case createEvent:
        return CupertinoPageRoute(builder: (context) => CreateEvent());
    }
  }
}
