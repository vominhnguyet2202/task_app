import 'package:flutter/material.dart';
import 'package:task_app/screens/recycle_bin.dart';
import 'package:task_app/screens/tab_screen.dart';

class AppRouter {
  MaterialPageRoute? onGenerateRouter(RouteSettings settings) {
    switch (settings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (context) => const RecycleBin());
      case TabScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TabScreen(),
        );
      default:
        return null;
    }
  }
}
