import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeTest extends StatelessWidget {
  const WelcomeTest({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double scaleFactor =
        screenWidth / 375.0; // Valor de referencia para el diseño 375, 445
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.all(20.0 * scaleFactor), // Espacio exterior escalado
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20 * scaleFactor), // Espacio escalado

                Container(
                  margin:
                      EdgeInsets.only(top: 20 * scaleFactor), // Margen escalado
                  width: screenWidth * 0.8, // Ancho relativo a la pantalla
                  constraints: BoxConstraints(
                      maxWidth: 340 * scaleFactor), // Ancho máximo escalado
                  padding: EdgeInsets.symmetric(
                      horizontal: 10 * scaleFactor,
                      vertical: 5 * scaleFactor), // Relleno escalado
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xFF7740AD),
                        width: 2 * scaleFactor), // Grosor escalado
                    borderRadius: BorderRadius.circular(
                        20 * scaleFactor), // Radio escalado
                  ),
                  child: Center(
                    child: Text(
                      '1 - Abecedario | LS Americana',
                      style: GoogleFonts.poppins(
                        fontSize: 18 * scaleFactor, // Tamaño de fuente escalado
                        color: const Color(0xFF7740AD),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40 * scaleFactor), // Espacio escalado

                FractionallySizedBox(
                  widthFactor: 0.44,
                  child: Image.asset('assets/images/sg.png'),
                ),
                SizedBox(height: 40 * scaleFactor), // Espacio escalado

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Es',
                      style: GoogleFonts.poppins(
                        fontSize: 37 * scaleFactor, // Tamaño de fuente escalado
                        color: const Color(0xFF273958),
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor), // Espacio escalado
                    Text(
                      'tiempo',
                      style: GoogleFonts.poppins(
                        fontSize: 37 * scaleFactor, // Tamaño de fuente escalado
                        color: const Color(0xFF273958),
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor), // Espacio escalado
                    Text(
                      'de practicar',
                      style: GoogleFonts.poppins(
                        fontSize: 37 * scaleFactor, // Tamaño de fuente escalado
                        color: const Color(0xFF273958),
                      ),
                    ),
                    SizedBox(height: 8 * scaleFactor), // Espacio escalado
                    Text(
                      'lo aprendido !!!!',
                      style: GoogleFonts.poppins(
                        fontSize: 37 * scaleFactor, // Tamaño de fuente escalado
                        color: const Color(0xFF273958),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20 * scaleFactor), // Espacio escalado

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'test');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA3A42B),
                    minimumSize: Size(
                        200 * scaleFactor, 60 * scaleFactor), // Tamaño escalado

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15 * scaleFactor), // Radio escalado
                    ),
                  ),
                  child: Text(
                    'Reconoce el signo!',
                    style: GoogleFonts.poppins(
                      fontSize: 20 * scaleFactor, // Tamaño de fuente escalado
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 20 * scaleFactor),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'cameraUse');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA3A42B),
                    minimumSize: Size(
                        200 * scaleFactor, 60 * scaleFactor), // Tamaño escalado

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15 * scaleFactor), // Radio escalado
                    ),
                  ),
                  child: Text(
                    'Prueba tus gestos!',
                    style: GoogleFonts.poppins(
                      fontSize: 20 * scaleFactor, // Tamaño de fuente escalado
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
