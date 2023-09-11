import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section/widgets/widgets.dart';

class CustomScreen1 extends StatelessWidget {
  const CustomScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildText(context, '¿Cuántos años tienes?', 20, 'istokWeb'),
        buildAge(context),
        buildStartButton(
            context, 'Siguiente', const Color(0xFF7740AD), 'custom2'),
      ]),
    ));
  }
}

Widget buildAge(BuildContext context) {
  final TextEditingController passwordController = TextEditingController();
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.02,
    ),
    width: 300 * scaleFactor,
    child: TextFormField(
        controller: passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
        ),
        keyboardType: TextInputType.number,
        style: GoogleFonts.istokWeb(
          fontSize: 20,
          color: const Color(0xFF000000),
        )),
  );
}
