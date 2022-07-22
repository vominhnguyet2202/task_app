import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/app/blocs/bloc/login_with_email_bloc.dart';
import 'package:task_app/feature/screens/onboarding_screen.dart';

import 'commons/blocs_export.dart';
import 'services/setting/app_router.dart';
import 'services/setting/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

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
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => LoginWithEmailBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const OnboardingScreen(),
            onGenerateRoute: appRouter.onGenerateRouter,
          );
        },
      ),
    );
  }
}
