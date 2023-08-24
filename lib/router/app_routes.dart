import 'package:flutter/material.dart';
import '/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'cardview';

  static Map<String, Widget Function(BuildContext)> routes = {
    'cardview': (BuildContext context) => const CardScreen(),
    'homeview': (BuildContext context) => const HomeScreen(),
    'abecedario': (BuildContext context) =>
        const Template(title: 'Abecedario', imageAsset: 'assets/abc.png'),
    'videos': (BuildContext context) => const VideoPlayerTemplate(),
    'welcometest': (BuildContext context) => const WelcomeTest(),
    'test': (BuildContext context) => const TestVoc(),
    'listview2': (BuildContext context) => const Listview2Screen(),
    'settings': (BuildContext context) => const HomeScreen(),
    'finalscore': (BuildContext context) => const FinalScore(),
  };
}
