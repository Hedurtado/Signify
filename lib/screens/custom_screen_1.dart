import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Signify/widgets/widgets.dart';

class CustomScreen1 extends StatefulWidget {
  const CustomScreen1({Key? key}) : super(key: key);

  @override
  State<CustomScreen1> createState() => _CustomScreen1State();
}

class _CustomScreen1State extends State<CustomScreen1> {
  final TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildText(context, '¿Cuántos años tienes?', 20, 'istokWeb'),
        buildAge(context, ageController),
        buildStartButton(
            context, 'Siguiente', const Color(0xFF7740AD), 'custom3'),
      ]),
    ));
  }
}

Widget buildAge(BuildContext context, TextEditingController ageController) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.02,
    ),
    width: 300 * scaleFactor,
    child: TextFormField(
        controller: ageController,
        decoration: const InputDecoration(
          labelText: 'Edad',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
        ),
        keyboardType: TextInputType.number,
        //Mostrar lo que se escribe
        obscureText: false,
        style: GoogleFonts.istokWeb(
          fontSize: 20,
          color: const Color(0xFF000000),
        )),
  );
}
