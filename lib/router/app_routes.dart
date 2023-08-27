import 'package:flutter/material.dart';
import '/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'firstpage';

  static Map<String, Widget Function(BuildContext)> routes = {
    'firstpage': (BuildContext context) => const HomePage(),
    'login': (BuildContext context) => const LoginPage(),
    'register': (BuildContext context) => const RegisterPage(),
    'cardview': (BuildContext context) => const CardScreen(),
    'homeview': (BuildContext context) => const HomeScreen(),
    'welcometest': (BuildContext context) => const WelcomeTest(),
    'test': (BuildContext context) => const TestVoc(),
    'listview2': (BuildContext context) => const Listview2Screen(),
    'settings': (BuildContext context) => const HomeScreen(),
    'finalscore': (BuildContext context) => const FinalScore(),
  };
}
