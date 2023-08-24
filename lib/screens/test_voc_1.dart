import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/test_voc.dart';

//Configure Firestore
FirebaseFirestore firestore = FirebaseFirestore.instance;

class TestVoc extends StatefulWidget {
  const TestVoc({super.key});

  @override
  _TestVocState createState() => _TestVocState();
}

class _TestVocState extends State<TestVoc> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  int pageIndex = 0; //Count the number of pages

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 365.0;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = index == 6;
                });
              },
              children: [
                Voc1(
                  context: context,
                  image: 'assets/images/sign.png',
                  meaning: "Significado de la señal",
                  title: '¿Cuál es la representación de la señas?',
                  description: 'Selecciona una de las opciones múltiples',
                  index: 0,
                ),
                Voc1(
                  context: context,
                  image: 'assets/images/sign.png',
                  meaning: "Significado de la señal",
                  title: '¿Esta en la 2da pestaña de aprendizaje?',
                  description: 'Marca una de las opciones',
                  index: 1,
                ),
                Voc1(
                  context: context,
                  image: 'assets/images/sign.png',
                  meaning: "Significado de la señal",
                  title: '¿Esta en la 3ra pestana de aprendizaje?',
                  description: 'Marca dos de las siguientes opciones',
                  index: 2,
                ),
                Voc1(
                  context: context,
                  image: 'assets/images/sign.png',
                  meaning: "Significado de la señal",
                  title: '¿Esta en la 4ta pestana de aprendizaje?',
                  description: 'Marca dos de las siguientes opciones',
                  index: 3,
                ),
                Voc1(
                  context: context,
                  image: 'assets/images/sign.png',
                  meaning: "Significado de la señal",
                  title: '¿Esta en la 5ta pestana de aprendizaje?',
                  description: 'Marca dos de las siguientes opciones',
                  index: 4,
                ),
                Voc1(
                  context: context,
                  image: 'assets/images/sign.png',
                  meaning: "Significado de la señal",
                  title: '¿Esta en la 6ta pestana de aprendizaje?',
                  description: 'Marca dos de las siguientes opciones',
                  index: 5,
                ),
              ],
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 6,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFFA3A42B),
                        dotColor: Color(0xFFD9D9D9),
                        dotHeight: 14,
                        dotWidth: 14,
                        expansionFactor: 4,
                        spacing: 5,
                      ),
                      onDotClicked: (index) => _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /* bottomSheet: onLastPage
          ? Container()
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                    ),
                    child: Text('Back'),
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ],
              ),
            ), */
    );
  }
}
