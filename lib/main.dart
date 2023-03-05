import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_downloder/home_module/presentation/feature/demo/screen/home_screen.dart';
import 'package:video_downloder/user_module/presentation/feature/demo/screen/login_screen.dart';

import 'base_module/domain/entity/app_theme_singleton.dart';
import 'base_module/presentation/fature/theming/bloc/theme_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await appTheme.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ThemeBloc>(
      lazy: false,
      create: (_) => ThemeBloc(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeBloc? _themeBloc;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      if (appTheme.themeType == ThemeType.system) {
        _themeBloc ??= BlocProvider.of<ThemeBloc>(context);

        _themeBloc?.add(ChangeTheme(
          themeType: appTheme.themeType,
        ));
      }
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, _) {
      return LayoutBuilder(builder: (_, constraints) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Video Player',
            theme: appTheme.themeData(),
            home: LoginScreen());
      });
    });
  }
}
