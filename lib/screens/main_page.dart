import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // Valor de referencia para el diseño 375, 445

    return Scaffold(body: Builder(
      builder: (BuildContext context) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLogo(context),
            buildIniciarSessionButton(context),
            buildRegisterButton(context),
          ],
        ));
      },
    ));
  }
}

Widget buildLogo(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.05,
    ),
    child: Image.asset(
      'assets/icons/launcher.png',
      width: 200,
      height: 200,
    ),
  );
}

Widget buildIniciarSessionButton(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.15,
    ),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'login');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7740AD),
        minimumSize:
            Size(200 * scaleFactor, 60 * scaleFactor), // Tamaño escalado

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15 * scaleFactor), // Radio escalado
        ),
      ),
      child: Text('Iniciar Sesion',
          style: GoogleFonts.jua(
            fontSize: 20,
            color: Colors.white,
          )),
    ),
  );
}

Widget buildRegisterButton(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.03,
    ),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'register');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFFFFF),
        minimumSize:
            Size(200 * scaleFactor, 60 * scaleFactor), // Tamaño escalado

        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15 * scaleFactor), // Radio escalado
        ),
      ),
      child: Text('Registrarse',
          style: GoogleFonts.jua(
            fontSize: 20,
            color: const Color(0xFFA3A42B),
          )),
    ),
  );
}
