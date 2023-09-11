import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOnlyLogo(context),
          buildText1(context),
          buidlText2(context),
          buildStartButton(
              context, 'Empezar', const Color(0xFF7740AD), 'home_test'),
        ],
      ),
    ));
  }
}

Widget buildOnlyLogo(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.08,
    ),
    width: 100 * scaleFactor,
    height: 100 * scaleFactor,
    child: Image.asset(
      'assets/images/signify-morado-log-1.png',
      width: MediaQuery.of(context).size.width * 0.5,
      fit: BoxFit.fitWidth,
    ),
  );
}

Widget buildText1(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.1,
    ),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¡BIENVENIDO!',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    )),
  );
}

Widget buidlText2(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
        bottom: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Aprende Lengua de Señas Americana (ASL)',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF788294))),
        ]),
      ));
}
