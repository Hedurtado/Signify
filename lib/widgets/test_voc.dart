import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Voc1({
  required BuildContext context,
  required String image,
  required String meaning,
  required String title,
  required String description,
  required int index,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            child: Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                softWrap: true,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF949494),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        height: MediaQuery.of(context).size.height * 0.57,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      Container(
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(
              onPressed: () {
                if (index == 5) {
                  Navigator.pushNamed(context, 'finalscore');
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(5.0),
                ),
              ),
              child: Text(
                'A',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(5.0),
                ),
              ),
              child: Text(
                'B',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(5.0),
                ),
              ),
              child: Text(
                'C',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(5.0),
                ),
              ),
              child: Text(
                'D',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.center,
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF949494),
          ),
        ),
      ),
    ],
  );
}
