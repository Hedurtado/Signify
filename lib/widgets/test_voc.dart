import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:video_player/video_player.dart';

class Voc1 extends StatefulWidget {
  final BuildContext context;
  final String image;
  final String meaning;
  final String title;
  final String description;
  final int index;
  const Voc1(
      {required this.context,
      required this.image,
      required this.meaning,
      required this.title,
      required this.description,
      required this.index,
      super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideosStateTest createState() => _VideosStateTest();
}

class _VideosStateTest extends State<Voc1> {
  int currentIndex = 0;
  int otherIndex = 0;
  late VideoPlayerController _controller;
  late Future<void>
      // ignore: unused_field
      _controllerInitializer; // Variable para la inicialización del controlador
  List<Map<String, String>> videos = [];

  @override
  void initState() {
    super.initState();

    // Iniciar la inicialización del controlador en el initState
    _getVideosFromFirestore();
  }

  Future<void> _getVideosFromFirestore() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection('Videos');
    QuerySnapshot querySnapshot = await collection.get();

    List<Map<String, String>> fetchvideos = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String title = data['title'];
      String url = data['url'];
      fetchvideos.add({
        'title': title,
        'url': url,
        'videoId': doc.id
      }); // Usar doc.id como identificador
    }

    setState(() {
      videos = fetchvideos;
      videos.sort(((a, b) => a['title']!.compareTo(b['title']!)));
    });

    _initializeController();
  }

  Future<void> _initializeController() async {
    String? videoUrl = videos[currentIndex]['url'];

    if (videoUrl != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.play();
    }
  }

  void moveToNext() {
    setState(() {
      if (currentIndex < videos.length - 1) {
        currentIndex = currentIndex + 1;
        otherIndex = currentIndex;
        _controller.dispose();
        _controller = VideoPlayerController.networkUrl(
            Uri.parse(videos[currentIndex]['url']!));
        _controller.initialize().then((_) {
          _controller.play();
        });
      }
    });
  }

  void moveToPrev() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex = currentIndex - 1;
        otherIndex = currentIndex;
        _controller.dispose();
        _controller = VideoPlayerController.networkUrl(
            Uri.parse(videos[currentIndex]['url']!));
        _controller.initialize().then((_) {
          _controller.play();
        });
      } else if (currentIndex == 0) {
        currentIndex = videos.length - 1;
        otherIndex = currentIndex;
        _controller.dispose();
        _controller = VideoPlayerController.networkUrl(
            Uri.parse(videos[currentIndex]['url']!));
        _controller.initialize().then((_) {
          _controller.play();
        });
      }
    });
  }

  Widget buildButtonOptions(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            child: InkWell(
              onTap: moveToPrev,
              child: Image.asset(
                'assets/double_left.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'abecedario');
                _controller.pause();
              },
              child: Image.asset(
                'assets/home.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.1,
            ),
            child: InkWell(
              onTap: moveToNext,
              child: Image.asset(
                'assets/double_right.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVideo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.03,
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.5,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ),
    );
  }

  Widget buildTitulo(BuildContext context) {
    final videoName = videos[currentIndex]['title'];
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Text(
        "Esta seña representa la letra \n$videoName",
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontFamily: 'istokWeb',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(color: Colors.purple),
          ));
    }
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
                      child: buildVideo(widget.context)),
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
