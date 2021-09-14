import 'package:flutter/material.dart';
import 'package:news_app/views/signup.dart';

class Routes {
  static const SIGN_UP_SCREEN_ROUTE = '/';
  static const SIGN_IN_SCREEN_ROUTE = '/home';
  static const NEWS_SCREEN_ROUTE = '/chat';
  static const FAVORITE_SCREEN_ROUTE = '/sign-up';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      SIGN_UP_SCREEN_ROUTE: (context) => SignUpScreen(),
    };
  }
}