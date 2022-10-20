import 'package:demo/app/app.dart';
import 'package:demo/app/pages/detail/detail.dart';
import 'package:demo/app/pages/my_document/my_document.dart';
import 'package:demo/app/pages/neted_page/nested_page.dart';
import 'package:demo/app/pages/receipt/receipt_page.dart';
import 'package:demo/app/pages/settings/settings.dart';
import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

class AppRoute {
  static const pageMyDocument = "/my_document";
  static const pageMySettings = "/settings";
  static const pageDetail = "/detail";
  static const pageNested = "/nested";
  static const pageReceipt = "/receipt";

  static Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pageDetail:
        return MaterialPageRoute(
          builder: (_) => Detail(),
          settings: settings,
        );
      case pageReceipt:
        return MaterialPageRoute(
          builder: (_) => Receipt(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings,
        );
    }
  }

  static Route<Object>? nestedRoute(RouteSettings settings) {
    switch (settings.name) {
      case pageMySettings:
        return MaterialPageRoute(
          builder: (_) => Settings(),
          settings: settings,
        );
      case pageDetail:
        return MaterialPageRoute(
          builder: (_) => Detail(),
          settings: settings,
        );
      case pageNested:
        return MaterialPageRoute(
          builder: (_) => NestedPage(),
          settings: settings,
        );
      case pageReceipt:
        return MaterialPageRoute(
          builder: (_) => Receipt(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => MyDocument(),
          settings: settings,
        );
    }
  }
}
