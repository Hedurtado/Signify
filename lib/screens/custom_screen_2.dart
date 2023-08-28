import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section/widgets/widgets.dart';

class CustomScreen2 extends StatelessWidget {
  const CustomScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText(
                context, '¿Necesitas sonido para aprender?', 20, 'istokWeb'),
            buildSound(context),
            buidlText(context),
            buildStartButton(
                context, 'Siguiente', const Color(0xFF7740AD), 'custom3'),
          ],
        ),
      ),
    );
  }
}

Widget buildSound(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.1,
    ),
    child: Center(
        child: Column(
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              minimumSize: Size(60 * scaleFactor, 60 * scaleFactor),
            ), // Tamaño escalado
            onPressed: () {
              //Logica para activar o desactivar sonido de los videos
            },
            child: Image.asset('assets/images/mute-1.png')),
      ],
    )),
  );
}

Widget buidlText(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.08,
    ),
    child: Text('Pulsa el ícono para activar o desactivar el sonido',
        textAlign: TextAlign.center,
        style: GoogleFonts.istokWeb(
          fontSize: 16,
          color: const Color(0xFF949494),
        )),
  );
}
