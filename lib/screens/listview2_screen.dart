import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const ['Megaman', 'Metal Gear', "GTA 5", 'Super Smash'];
  final int morado = 0xFF7740AD;
  final int verde = 0xFFA3A42B;

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List view tipo2'),
        elevation: 1,
        backgroundColor: Color(morado),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            options[index],
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            final game = options[index];
            print(game);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
