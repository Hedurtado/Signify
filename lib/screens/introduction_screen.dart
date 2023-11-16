import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLetterLogo(context),
            buildText(context),
            buildCustomText(context),
            buildStartButton(context)
          ],
        ),
      ),
    ));
  }
}

Widget buildLetterLogo(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.05,
    ),
    width: 200 * scaleFactor,
    height: 100 * scaleFactor,
    child: Image.asset(
      'assets/images/letter_logo.png',
      fit: BoxFit.fitWidth,
    ),
  );
}

Widget buildText(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
      ),
      width: 300 * scaleFactor,
      //border
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 145, 145, 145),
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¡Estás a un ',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'click',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
          Text(
            'de lograr una',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text('sociedad más',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              )),
          Text(
            'inclusiva!',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ));
}

Widget buildCustomText(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.08,
      ),
      child: Center(
          child: Column(
        children: [
          Text('Personaliza',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              )),
          Text(
            'tu experiencia',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      )));
}

Widget buildStartButton(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.07,
      ),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'custom1');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7740AD),
                  minimumSize: Size(
                      200 * scaleFactor, 60 * scaleFactor), // Tamaño escalado
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * scaleFactor),
                  )),
              child: Text('Comenzar',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                  )))
        ],
      ));
}
