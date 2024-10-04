import 'package:flutter/material.dart';
import 'home_page.dart';
import 'categories_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'login_page.dart';        // Ensure this imports the correct LoginPage
import 'register_page.dart';     // Ensure this imports the correct RegisterPage
import 'welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apparel App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.brown,
        colorScheme: const ColorScheme.light(
          primary: Colors.brown,
          background: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.brown,
        colorScheme: const ColorScheme.dark(
          primary: Colors.brown,
          background: Colors.black,
        ),
      ),
      themeMode: ThemeMode.system, // Use system theme mode
      initialRoute: '/',  // The initial route when the app launches
      routes: {
        '/': (context) => const WelcomePage(),         // Welcome page
        '/login': (context) => const LoginScreen(),       // Login page
        '/register': (context) => const RegisterScreen(), // Register page
        '/home': (context) => const HomePage(),         // Home page
        '/categories': (context) => const CategoriesPage(),  // Categories page
        '/cart': (context) => const CartPage(),         // Cart page
        '/profile': (context) => const ProfilePage(),   // Profile page
      },
    );
  }
}
