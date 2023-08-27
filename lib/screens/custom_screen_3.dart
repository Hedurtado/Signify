import 'package:flutter/material.dart';
import 'package:section/widgets/widgets.dart';

class CustomScreen3 extends StatefulWidget {
  const CustomScreen3({Key? key}) : super(key: key);

  @override
  _CustomScreen3State createState() => _CustomScreen3State();
}

class _CustomScreen3State extends State<CustomScreen3> {
  bool isLightMode = true;

  void toggleLightMode() {
    setState(() {
      isLightMode = !isLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildText(
              context,
              'Escoje entre el modo oscuro o claro',
              20,
              'istokWeb',
            ),
            Visibility(
              visible: isLightMode,
              child: buildLight(context),
            ),
            Visibility(
              visible: !isLightMode,
              child: buildDark(context),
            ),
            buildStartButton(
              context,
              'Siguiente',
              const Color(0xFF7740AD),
              'welcomepage',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLight(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 375.0;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              minimumSize: Size(60 * scaleFactor, 60 * scaleFactor),
            ),
            onPressed: toggleLightMode,
            child: Image.asset('assets/images/sun-11.png'),
          ),
        ],
      ),
    );
  }

  Widget buildDark(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 375.0;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              minimumSize: Size(60 * scaleFactor, 60 * scaleFactor),
            ),
            onPressed: toggleLightMode,
            child: Image.asset('assets/images/moon-11.png'),
          ),
        ],
      ),
    );
  }
}
