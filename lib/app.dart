import 'package:client_service/utils/events/splash_screen.dart';
import 'package:client_service/services/navigation_service.dart';
import 'package:client_service/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMEVEC',
      navigatorKey: NavigationService.navigatorKey,
      home: const SplashScreen(),
      routes: routes,
      // Add localization support
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', 'ES'), // Spanish
      ],
      locale: const Locale('es', 'ES'),
    );
  }
}
