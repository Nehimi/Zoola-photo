import 'package:flutter/material.dart';
import 'package:zoola_pic/presentation/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoola Pic',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0A79DF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0A79DF),
          secondary: Color(0xFF0A79DF),
          background: Color(0xFF121212), // A standard dark background color
          surface: Color(0xFF1E1E1E), // For cards and other surfaces
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: const Color(0xFF1E1E1E),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A79DF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF1E1E1E),
            selectedItemColor: Color(0xFF0A79DF),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
