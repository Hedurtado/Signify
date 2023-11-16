import 'package:flutter/material.dart';
import 'package:Signify/screens/screens.dart';
import 'package:lottie/lottie.dart';
import '/theme/app_theme.dart';

import '/widgets/widgets.dart';

class CardScreen2 extends StatelessWidget {
  const CardScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.purple,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.purple,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Listo para aprender?',
            style: TextStyle(color: AppTheme.secondary, fontSize: 25),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'settings');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(color: AppTheme.purple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: const Text(
                    'Elige el tema',
                    style: TextStyle(color: AppTheme.secondary, fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Template(
                                  title: 'Abecedario',
                                  imageAsset: 'assets/images/Abecedario.png',
                                  language: 'ecuadorian',
                                )));
                  },
                  child: const CustomCardType2(
                    backgroundcolor: AppTheme.green,
                    imageUrl: 'assets/images/Abecedario.png',
                    name: 'Abecedario',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Template(
                                  title: 'Numeros',
                                  imageAsset: 'assets/home_img/numeros.png',
                                  language: 'ecuadorian',
                                )));
                  },
                  child: const CustomCardType2(
                    imageUrl: 'assets/home_img/numeros.png',
                    backgroundcolor: Color.fromARGB(255, 221, 225, 255),
                    name: 'Números',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Template(
                                  title: 'Dias',
                                  imageAsset: 'assets/home_img/dias.png',
                                  language: 'ecuadorian',
                                )));
                  },
                  child: const CustomCardType2(
                    imageUrl: 'assets/home_img/dias.png',
                    backgroundcolor: Color.fromARGB(255, 43, 164, 91),
                    name: 'Días',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Template(
                                  title: 'Meses',
                                  imageAsset: 'assets/home_img/meses.png',
                                  language: 'ecuadorian',
                                )));
                  },
                  child: const CustomCardType2(
                    imageUrl: 'assets/home_img/meses.png',
                    backgroundcolor: Color.fromARGB(255, 231, 156, 87),
                    name: 'Meses',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Template(
                                  title: 'Saludos',
                                  imageAsset: 'assets/home_img/saludos.png',
                                  language: 'ecuadorian',
                                )));
                  },
                  child: const CustomCardType2(
                    imageUrl: 'assets/home_img/saludos.png',
                    backgroundcolor: Color.fromARGB(255, 252, 91, 91),
                    name: 'Saludos',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const Template(
                                  title: 'Colores',
                                  imageAsset: 'assets/home_img/colores.png',
                                  language: 'ecuadorian',
                                )));
                  },
                  child: const CustomCardType2(
                    imageUrl: 'assets/home_img/colores.png',
                    backgroundcolor: AppTheme.purple,
                    name: 'Colores',
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
