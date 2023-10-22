import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController realnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    realnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSmallLogo(context),
              buildUserName(context, usernameController),
              buildRealName(context, realnameController),
              buildEmail(context, emailController),
              buildPassword(context, passwordController),
              buildRegister(
                context,
                usernameController,
                realnameController,
                emailController,
                passwordController,
              ),
            ],
          ),
        ),
      ),
    );
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

  Widget buildUserName(
      BuildContext context, TextEditingController usernameController) {
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
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget buildRealName(
      BuildContext context, TextEditingController realnameController) {
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
          labelText: 'Nombres',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget buildEmail(
      BuildContext context, TextEditingController emailController) {
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
          labelText: 'Correo electrónico',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget buildPassword(
      BuildContext context, TextEditingController passwordController) {
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
          labelText: 'Contraseña',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        obscureText: true,
        style: GoogleFonts.jua(
          fontSize: 20,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }

  Widget buildRegister(
    BuildContext context,
    TextEditingController usernameController,
    TextEditingController realnameController,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 375.0;

    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
      ),
      child: ElevatedButton(
        onPressed: () async {
          try {
            String email = emailController.text;
            String password = passwordController.text;
            String username = usernameController.text;
            String realname = realnameController.text;
            UserCredential userCredential =
                await _auth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            );
            usersCollection.doc(userCredential.user!.uid).set({
              'username': username,
              'realname': realname,
              'email': email,
              'password': password,
            });
// Navegar a la siguiente pantalla
            Navigator.pushNamed(context, 'introduction');
          } catch (e) {
            print('Error al registrar usuario: $e');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7740AD),
          minimumSize: Size(200 * scaleFactor, 60 * scaleFactor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15 * scaleFactor),
          ),
        ),
        child: Text(
          'Registrarse',
          style: GoogleFonts.jua(
            fontSize: 20,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
