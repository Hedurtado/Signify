import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSmallLogo(context),
              buildUserName(context),
              buildRealName(context),
              buildEmail(context),
              buildPassword(context),
              buildRegister(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSmallLogo(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.08,
    ),
    child: Image.asset(
      'assets/icons/launcher.png',
      width: 100,
      height: 100,
    ),
  );
}

Widget buildUserName(BuildContext context) {
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
          labelText: 'Usuario',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
        ),
        keyboardType: TextInputType.text,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color(0x00000000),
        )),
  );
}

Widget buildRealName(BuildContext context) {
  final TextEditingController realnameController = TextEditingController();
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.02,
    ),
    width: 300 * scaleFactor,
    child: TextFormField(
        controller: realnameController,
        decoration: const InputDecoration(
          labelText: 'Names',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
        ),
        keyboardType: TextInputType.text,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color(0x00000000),
        )),
  );
}

Widget buildEmail(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.02,
    ),
    width: 300 * scaleFactor,
    child: TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
        ),
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color(0x00000000),
        )),
  );
}

Widget buildPassword(BuildContext context) {
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
          labelText: 'Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color(0x00000000),
        )),
  );
}

Widget buildRegister(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double scaleFactor = screenWidth / 375.0;
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.1,
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
      child: Text('Registrarse',
          style: GoogleFonts.jua(
            fontSize: 20,
            color: const Color(0xFFFFFFFF),
          )),
    ),
  );
}
