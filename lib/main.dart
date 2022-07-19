import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:task_app/services/app_router.dart';
import 'package:task_app/services/app_theme.dart';

import 'commons/blocs_export.dart';
import 'feature/screens/tab_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(appRouter: AppRouter())),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter, super.key});
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TabScreen(),
            onGenerateRoute: appRouter.onGenerateRouter,
          );
        },
      ),
    );
  }
}
