import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final String route;
  const Button(
      {super.key,
      required this.text,
      required this.color,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildStartButton(context, text, color, route)]),
    ));
  }
}

Widget buildStartButton(
    BuildContext context, String text, Color color, String route) {
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
                Navigator.pushNamed(context, route);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  minimumSize: Size(
                      200 * scaleFactor, 60 * scaleFactor), // Tamaño escalado
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20 * scaleFactor),
                  )),
              child: Text(text,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                  )))
        ],
      ));
}
