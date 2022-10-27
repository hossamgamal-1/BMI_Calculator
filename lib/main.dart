import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/app_theme/app_dark_theme.dart';
import 'services/bmi/view/screens/calculations_screen.dart';
import 'services/bmi/providers/calculations_provider/calculations_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid || Platform.isIOS
      ? SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      : null;
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      builder: (context, child) => MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'BMI App',
        theme: AppDarkTheme.themeData,
        home: const CalculationsScreen(),
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => CalculationsProvider()),
      ],
    );
  }
}
