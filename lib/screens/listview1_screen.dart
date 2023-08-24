import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const ['Megaman', 'Metal Gear', "GTA 5", 'Super Smash'];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List view tipo1'),
      ),
      body: ListView(
        children: [
          ...options
              .map((game) => ListTile(
                    title: Text(game),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
