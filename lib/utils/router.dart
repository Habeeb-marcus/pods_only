import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pods_only/ui/screens/detail_page.dart';
import 'package:pods_only/ui/screens/home.dart';

class RouteHelper {
  static const String home = '/';
  static const String detailRoute = 'DetailPage';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return PageTransition(
            child: Home(),
            type: PageTransitionType.leftToRightWithFade,
            settings: settings);
      case detailRoute:
        dynamic args = settings.arguments;
        return PageTransition(
            child: DetailPage(
              item: args,
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: settings);

      default:
        return null;
    }
  }
}
