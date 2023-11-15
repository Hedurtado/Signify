import 'package:flutter/material.dart';
import '/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'firstpage';

  static Map<String, Widget Function(BuildContext)> routes = {
    'firstpage': (BuildContext context) => const HomePage(),
    'login': (BuildContext context) => const LoginPage(),
    'register': (BuildContext context) => const RegisterPage(),
    'introduction': (BuildContext context) => const IntroductionScreen(),
    'custom1': (BuildContext context) => const CustomScreen1(),
    'custom2': (BuildContext context) => const CustomScreen2(),
    'custom3': (BuildContext context) => const CustomScreen3(),
    'welcomepage': (BuildContext context) => const WelcomePage(),
    'cardview': (BuildContext context) => const CardScreen(),
    'cardview2': (BuildContext context) => const CardScreen2(),
    'homeview': (BuildContext context) => const HomeScreen(),
    'settings': (BuildContext context) => const HomeScreen(),
    'home_test': (BuildContext context) => const MyHomePage(),
  };
}
