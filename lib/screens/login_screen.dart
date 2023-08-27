import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section/screens/screens.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSmallLogo(context),
              buildLoginEmail(context),
              buildLoginPassword(context),
              buildLogin(context),
              buildOtherOption(context),
              buildOtherLogins(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildLoginEmail(BuildContext context) {
  final TextEditingController usernameController = TextEditingController();
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      width: 300 * scaleFactor,
      child: TextFormField(
          controller: usernameController,
          decoration: const InputDecoration(
              labelText: 'Usuario o Correo',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(20),
              ))),
          keyboardType: TextInputType.emailAddress,
          style: GoogleFonts.jua(
            fontSize: 20,
            color: const Color(0x00000000),
          )));
}

Widget buildLoginPassword(BuildContext context) {
  final TextEditingController passwordController = TextEditingController();
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
      ),
      width: 300 * scaleFactor,
      child: TextFormField(
          controller: passwordController,
          decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(20),
              ))),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          style: GoogleFonts.jua(
            fontSize: 20,
            color: const Color(0x00000000),
          )));
}

Widget buildLogin(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.2,
    ),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'introduction');
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
            color: const Color(0xFFFFFFFF),
          )),
    ),
  );
}

Widget buildOtherOption(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Text(
        'O Inicia Sesion con',
        style: GoogleFonts.istokWeb(
          fontSize: 12,
          color: const Color(0xFF949494),
        ),
      ));
}

Widget buildOtherLogins(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  minimumSize: Size(60 * scaleFactor, 60 * scaleFactor),
                ), // Tamaño escalado
                onPressed: () {},
                child: Image.asset('assets/images/google.png')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  minimumSize: Size(60 * scaleFactor, 60 * scaleFactor),
                ), // Tamaño escalado
                onPressed: () {},
                child: Image.asset('assets/images/facebook.png')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  minimumSize: Size(60 * scaleFactor, 60 * scaleFactor),
                ), // Tamaño escalado
                onPressed: () {},
                child: Image.asset('assets/images/twitter.png')),
          ]));
}
