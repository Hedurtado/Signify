import 'package:flutter/material.dart';
import 'package:section/screens/screens.dart';
import 'package:country_flags/country_flags.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Índice de la pestaña seleccionada

  final List<Widget> _pages = [
    // Lista de pantallas de inicio
    const CardScreen(),
    const CardScreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Cambia el índice de la pestaña seleccionada al tocar una pestaña en la barra inferior
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: CountryFlag.fromCountryCode(
              'US',
              height: 25,
              width: 20,
              borderRadius: 2,
            ),
            label: 'LSA',
          ),
          BottomNavigationBarItem(
            icon: CountryFlag.fromCountryCode(
              'EC',
              height: 25,
              width: 20,
              borderRadius: 2,
            ),
            label: 'LSE',
          ),
        ],
      ),
    );
  }
}

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pantalla de Inicio 1'),
    );
  }
}

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pantalla de Inicio 2'),
    );
  }
}
