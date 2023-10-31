import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:section/screens/final_score.dart';
import 'package:video_player/video_player.dart';

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
                    widget.onChange();
                  } else {
                    incrementWrongAnswers();
                    widget.onChange();
                  }
                  if (widget.index == 5) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinalScore(
                                title: widget.title,
                                correctAnswers: correctAnswers,
                                wrongAnswers: wrongAnswers)));
                    Future.delayed(const Duration(seconds: 1), () {
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
                    widget.onChange();
                  } else {
                    incrementWrongAnswers();
                    widget.onChange();
                  }
                  if (widget.index == 5) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinalScore(
                                title: widget.title,
                                correctAnswers: correctAnswers,
                                wrongAnswers: wrongAnswers)));
                    Future.delayed(const Duration(seconds: 1), () {
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
                    widget.onChange();
                  } else {
                    incrementWrongAnswers();
                    widget.onChange();
                  }
                  if (widget.index == 5) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinalScore(
                                title: widget.title,
                                correctAnswers: correctAnswers,
                                wrongAnswers: wrongAnswers)));
                    Future.delayed(const Duration(seconds: 1), () {
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
                    widget.onChange();
                  } else {
                    incrementWrongAnswers();
                    widget.onChange();
                  }
                  if (widget.index == 5) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinalScore(
                                title: widget.title,
                                correctAnswers: correctAnswers,
                                wrongAnswers: wrongAnswers)));
                    Future.delayed(const Duration(seconds: 1), () {
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
