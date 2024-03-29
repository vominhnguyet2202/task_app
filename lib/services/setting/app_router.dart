import 'package:flutter/material.dart';


import '../../feature/screens/tab_screens/tab_screen.dart';
import '../../feature/screens/task_screens/recycle_bin.dart';
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
