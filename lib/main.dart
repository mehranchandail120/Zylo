import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const ZyloApp());
}

class ZyloApp extends StatelessWidget {
  const ZyloApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zylo.pages',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0284C7),
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        fontFamily: 'Roboto', // Using default sans-serif to match Poppins look
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF374151)),
          titleTextStyle: TextStyle(
            color: Color(0xFF0284C7),
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}