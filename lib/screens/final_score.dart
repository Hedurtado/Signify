import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome_test.dart';

class FinalScore extends StatelessWidget {
  final String title;
  final int correctAnswers;
  final int wrongAnswers;
  const FinalScore({
    required this.title,
    required this.correctAnswers,
    required this.wrongAnswers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late String message;
    if (correctAnswers == 0) {
      message = 'No has acertado ninguna palabra.\n¡Intenta de nuevo!';
    } else if (correctAnswers <= 4 && correctAnswers >= 1) {
      message = '¡Buen trabajo, pero lo puedes hacer mejor! ';
    } else if (correctAnswers >= 5) {
      message = '¡Excelente trabajo!\n ¡Sigue asi!';
    }
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
                SizedBox(height: 60 * scaleFactor), // Espacio escalado

                // Espacio escalado

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: GoogleFonts.poppins(
                        fontSize: 25 * scaleFactor, // Tamaño de fuente escalado
                        color: const Color(0xFF273958),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 90 * scaleFactor), // Espacio escalado

                //Create a rectangle that contains 1 column and 4 rows. The first columns contains text, the second a number, the third text and the last a number all content centered.
                Container(
                  decoration: BoxDecoration(
                    // Tamaño escalado
                    borderRadius: BorderRadius.circular(
                        20 * scaleFactor), // Radio escalado
                    color: const Color(0xFFE5E5E5),
                  ),
                  padding: EdgeInsets.all(20 * scaleFactor),
                  constraints: BoxConstraints(
                    minWidth: 270 * scaleFactor,
                    minHeight: 60 * scaleFactor, // Tamaño escalado
                  ),
                  //Relleno escalado
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Preguntas Correctas',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  20 * scaleFactor, // Tamaño de fuente escalado
                              color: const Color(0xFF273958),
                            ),
                          ),
                          Text(
                            correctAnswers.toString(),
                            style: GoogleFonts.poppins(
                              fontSize:
                                  20 * scaleFactor, // Tamaño de fuente escalado
                              color: const Color(0xFF273958),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20 * scaleFactor), // Espacio escalado

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20 * scaleFactor), // Radio escalado
                    color: const Color(0xFFE5E5E5),
                  ),
                  padding: EdgeInsets.all(20 * scaleFactor),
                  constraints: BoxConstraints(
                    minWidth: 270 * scaleFactor,
                    minHeight: 60 * scaleFactor, // Tamaño escalado
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Preguntas Incorrectas',
                            style: GoogleFonts.poppins(
                              fontSize:
                                  20 * scaleFactor, // Tamaño de fuente escalado
                              color: const Color(0xFF273958),
                            ),
                          ),
                          Text(
                            wrongAnswers.toString(),
                            style: GoogleFonts.poppins(
                              fontSize:
                                  20 * scaleFactor, // Tamaño de fuente escalado
                              color: const Color(0xFF273958),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 90 * scaleFactor),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeTest(title: title)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA3A42B),
                        minimumSize: Size(130 * scaleFactor, 50 * scaleFactor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15 * scaleFactor),
                        ),
                      ),
                      child: Text(
                        'Repetir',
                        style: GoogleFonts.poppins(
                          fontSize: 20 * scaleFactor,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 40 * scaleFactor), // Espacio entre los botones
                    ElevatedButton(
                      onPressed: () {
                        //TODO: Agregar que al darle continuar se vaya a la seccion y no a la homepage
                        Navigator.pushNamed(context, 'home_test');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFFA3A42B), // Color de fondo del botón "Continuar"
                        minimumSize: Size(130 * scaleFactor, 50 * scaleFactor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15 * scaleFactor),
                        ),
                      ),
                      child: Text(
                        'Continuar',
                        style: GoogleFonts.poppins(
                          fontSize: 20 * scaleFactor,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
