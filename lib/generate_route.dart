import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lightproject/view/authen/forgotpassword/forgotpassword_screen.dart';
import 'package:lightproject/view/authen/login/login_screen.dart';
import 'package:lightproject/view/authen/register/register_screen.dart';
import 'package:lightproject/view/home/home.dart';
import 'package:lightproject/view/home/homepage/test.dart';
import 'package:lightproject/view/shopping/shopping_categories_item_filter.dart';
import 'package:lightproject/widgets/itemproduct_grid_categories.dart';
import 'package:page_transition/page_transition.dart';

class GenerateRoute {
  PageTransition checkRoute(RouteSettings setting) {
    log(setting.name.toString());

    switch (setting.name) {
      case '/home':
        return _pageRoute(setting, HomePageScreen());
      case '/login':
        return _pageRoute(setting, LoginScreen());
      case '/register':
        return _pageRoute(setting, RegisterScreen());
      case '/forgotpassword':
        return _pageRoute(setting, ForgotPassWordScreen());
      case '/categoriesfilter':
        return _pageRoute(setting, ShoppingCategoriesItemFilter());
        case '/test':
        return _pageRoute(setting, TestScreen());
      //-- default
      default:
        return _pageRoute(RouteSettings(name: "/home"), HomePageScreen());
    }
  }

  PageTransition _pageRoute(RouteSettings setting, Widget page,
          {PageTransitionType? transition}) =>
      PageTransition(
        child: page,
        type: transition ?? PageTransitionType.rightToLeft,
        settings:
            RouteSettings(name: setting.name, arguments: setting.arguments),
      );
}
