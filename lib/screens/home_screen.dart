import 'package:flutter/material.dart';

import '/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final options = const ['Megaman', 'Metal Gear'];
  double _sliderValue = 100;
  final bool _sliderEnabled = true;
  bool _sonidoEnable = true;
  bool _modooscuroEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF7740AD),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF7740AD),
          title: const Text(
            'Configuraciones',
          ),
        ),
        body: Column(
          children: [
            SwitchListTile.adaptive(
                activeColor: AppTheme.primary,
                title: const Text(
                  'Activar/Desactivar Sonido',
                  style: TextStyle(color: AppTheme.secondary),
                ),
                value: _sonidoEnable,
                onChanged: (value) => setState(() {
                      _sonidoEnable = value;
                    })),
            SwitchListTile.adaptive(
                activeColor: AppTheme.primary,
                title: const Text(
                  'Activar/Desactivar Modo Oscuro',
                  style: TextStyle(color: AppTheme.secondary),
                ),
                value: _modooscuroEnable,
                onChanged: (value) => setState(() {
                      _modooscuroEnable = value;
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Tamaño del texto',
                    style: TextStyle(color: AppTheme.secondary)),
                Slider.adaptive(
                    min: 10,
                    max: 400,
                    activeColor: AppTheme.primary,
                    value: _sliderValue,
                    onChanged: _sliderEnabled
                        ? (value) {
                            _sliderValue = value;
                            setState(() {});
                          }
                        : null),
              ],
            ),
            const Text(
              'Soporte',
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: AppTheme.secondary),
            ),
            const Divider(),
            ListTile(
              title: const Text('Términos de Uso',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppTheme.secondary)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: AppTheme.secondary),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Uso de Datos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppTheme.secondary)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: AppTheme.secondary),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Ayuda',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppTheme.secondary)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: AppTheme.secondary),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Contacto',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppTheme.secondary)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: AppTheme.secondary),
              onTap: () {},
            ),
            const Divider()
          ],
        ));
  }
}
