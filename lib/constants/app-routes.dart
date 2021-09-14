import 'package:flutter/material.dart';
import 'package:news_app/views/news.dart';
import 'package:news_app/views/signin.dart';
import 'package:news_app/views/signup.dart';

class Routes {
  static const SIGN_UP_SCREEN_ROUTE = '/';
  static const SIGN_IN_SCREEN_ROUTE = '/sign-in';
  static const NEWS_SCREEN_ROUTE = '/news';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      SIGN_UP_SCREEN_ROUTE: (context) => SignUpScreen(),
      SIGN_IN_SCREEN_ROUTE: (context) => SignInScreen(),
      NEWS_SCREEN_ROUTE: (context) => NewsScreen(),
    };
  }
}