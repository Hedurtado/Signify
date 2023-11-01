import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section/screens/final_score.dart';
import 'package:video_player/video_player.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Voc1 extends StatefulWidget {
  final BuildContext context;
  final Widget image;
  final String meaning;
  final String title;
  final String description;
  final int index;
  final VideoPlayerController videoController;
  final Function onChange;
  final List<String> sign;
  final int cIndex;

  const Voc1({
    super.key,
    required this.context,
    required this.image,
    required this.meaning,
    required this.title,
    required this.description,
    required this.index,
    required this.videoController,
    required this.onChange,
    required this.sign,
    required this.cIndex,
  });

  @override
  State<Voc1> createState() => _Voc1State();
}

class _Voc1State extends State<Voc1> {
  static int correctAnswers = 0;
  static int wrongAnswers = 0;

  void incrementCorrectAnswers() {
    setState(() {
      correctAnswers += 1;
    });
  }

  void incrementWrongAnswers() {
    setState(() {
      wrongAnswers += 1;
    });
  }

  void resetAnswers() {
    setState(() {
      correctAnswers = 0;
      wrongAnswers = 0;
    });
  }

  void showAnswerAlert(BuildContext context, bool isCorrect) {
    String message =
        isCorrect ? "¡Respuesta correcta!" : "Respuesta incorrecta :(";
    IconData iconData = isCorrect ? Icons.check : Icons.close;

    // Create a custom widget for the toast message with an icon
    Widget toastWidget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: Colors.white),
          const SizedBox(width: 8.0),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );

    // Show the custom widget as a toast message
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: toastWidget,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(milliseconds: 1000),
    );
  }

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
                  widget.meaning,
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
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: VideoPlayer(widget.videoController),
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
                  if (widget.sign[widget.cIndex] == widget.sign[0]) {
                    incrementCorrectAnswers();
                    showAnswerAlert(context, true);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  } else {
                    incrementWrongAnswers();
                    showAnswerAlert(context, false);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  }
                  if (widget.index == 5) {
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalScore(
                                  title: widget.title,
                                  correctAnswers: correctAnswers,
                                  wrongAnswers: wrongAnswers)));
                    });
                    Future.delayed(const Duration(milliseconds: 2200), () {
                      resetAnswers();
                    });
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(5.0),
                  ),
                ),
                child: Text(
                  widget.sign[0],
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.sign[widget.cIndex] == widget.sign[1]) {
                    incrementCorrectAnswers();
                    showAnswerAlert(context, true);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  } else {
                    incrementWrongAnswers();
                    showAnswerAlert(context, false);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  }
                  if (widget.index == 5) {
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalScore(
                                  title: widget.title,
                                  correctAnswers: correctAnswers,
                                  wrongAnswers: wrongAnswers)));
                    });
                    Future.delayed(const Duration(milliseconds: 2200), () {
                      resetAnswers();
                    });
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(5.0),
                  ),
                ),
                child: Text(
                  widget.sign[1],
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.sign[widget.cIndex] == widget.sign[2]) {
                    incrementCorrectAnswers();
                    showAnswerAlert(context, true);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  } else {
                    incrementWrongAnswers();
                    showAnswerAlert(context, false);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  }
                  if (widget.index == 5) {
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalScore(
                                  title: widget.title,
                                  correctAnswers: correctAnswers,
                                  wrongAnswers: wrongAnswers)));
                    });
                    Future.delayed(const Duration(milliseconds: 2200), () {
                      resetAnswers();
                    });
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(5.0),
                  ),
                ),
                child: Text(
                  widget.sign[2],
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.sign[widget.cIndex] == widget.sign[3]) {
                    incrementCorrectAnswers();
                    showAnswerAlert(context, true);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  } else {
                    incrementWrongAnswers();
                    showAnswerAlert(context, false);
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      widget.onChange();
                    });
                  }
                  if (widget.index == 5) {
                    Future.delayed(const Duration(milliseconds: 1400), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinalScore(
                                  title: widget.title,
                                  correctAnswers: correctAnswers,
                                  wrongAnswers: wrongAnswers)));
                    });
                    Future.delayed(const Duration(milliseconds: 2200), () {
                      resetAnswers();
                    });
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(5.0),
                  ),
                ),
                child: Text(
                  widget.sign[3],
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
