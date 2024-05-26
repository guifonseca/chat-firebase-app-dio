import 'package:firebaseappdio/pages/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Colors.blue,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)),
        useMaterial3: true,
      ),
      home: const SplashScreenPage(),
    );
  }
}
