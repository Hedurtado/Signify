import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Voc1 extends StatefulWidget {
  final BuildContext context;
  final String image;
  final String meaning;
  final String title;
  final String description;
  final int index;

  const Voc1({
    super.key,
    required this.context,
    required this.image,
    required this.meaning,
    required this.title,
    required this.description,
    required this.index,
  });
  @override
  State<Voc1> createState() => _Voc1State();
}

class _Voc1State extends State<Voc1> {
  @override
  Widget build(BuildContext context) {
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
                  widget.title,
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
                      widget.image,
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
                  if (widget.index == 5) {
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
            widget.description,
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
}
