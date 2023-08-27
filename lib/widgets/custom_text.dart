import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;

  const CustomText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildText(context, text, fontSize, fontFamily),
    ])));
  }
}

Widget buildText(
    BuildContext context, String text, double fontSize, String fontFamily) {
  return Container(
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.08,
    ),
    child: Center(
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    ),
  );
}
