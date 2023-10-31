import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/test_voc.dart';
import '/videos.dart';
import 'dart:math';

class TestVoc extends StatefulWidget {
  final String title;
  const TestVoc({required this.title, super.key});

  @override
  _TestVocState createState() => _TestVocState();
}

class _TestVocState extends State<TestVoc> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  int pageIndex = 0; //Count the number of pages
  late int randomIndex;
  late int indexUsed;
  Random random = Random();
  int currentIndex = 0;
  int otherIndex = 0;
  int correctOption = 0;
  List<String> randomVideoTitles = [];
  late VideoPlayerController _videoController;
  late Future<void>
      // ignore: unused_field
      _controllerInitializer; // Variable para la inicialización del controlador
  List<Map<String, String>> videos = [];

  @override
  void initState() {
    super.initState();
    // Iniciar la inicialización del controlador en el initState
    _getVideosFromFirestore();
    randomVideoIndex();
  }

  randomVideoIndex() {
    if (videos.isEmpty) {
      randomIndex = 0;
    } else {
      randomIndex = random.nextInt(videos.length);
    }
    return randomIndex;
  }

  Future<void> _getVideosFromFirestore() async {
    CollectionReference collection =
        FirebaseFirestore.instance.collection(widget.title);
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
    indexUsed = randomVideoIndex();
    String? videoUrl = videos[indexUsed]['url'];

    if (videoUrl != null) {
      _videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      await _videoController.initialize();
      await _videoController.setLooping(true);
      await _videoController.play();
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  bool optionsChanged =
      false; // Bandera para controlar si ya se cambiaron las opciones

  void moveToNext() {
    setState(() {
      if (pageIndex < 6) {
        pageIndex++;
        _controller.animateToPage(pageIndex,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        _videoController.dispose();
        // indexUsed = randomVideoIndex();
        _videoController = VideoPlayerController.networkUrl(
            Uri.parse(videos[indexUsed]['url']!));
        _videoController.initialize().then((_) {
          _videoController.play();
          _videoController.setLooping(true);
        });

        // Set the optionsChanged flag to true after the page has changed
        optionsChanged = true;

        // Call the method to change the options
        randomVideoTitles = createRandomVideoList(videos[indexUsed]['title']!);
        // Use the randomVideoTitles to update the options as per your requirements
      }
    });
  }

  List<String> createRandomVideoList(String currentTitle) {
    List<String> randomVideoTitles = [
      currentTitle,
    ];

    videos.shuffle();

    randomVideoTitles.addAll(videos
        .map((video) => video['title'])
        .where((title) => title != null && title != currentTitle)
        .take(3)
        .whereType<String>() // Filter out null values
        .toList());
    randomVideoTitles.shuffle();
    correctOption = randomVideoTitles.indexOf(currentTitle);

    return randomVideoTitles;
  }

  Widget buildVideo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.03,
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.2,
      child: AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: VideoPlayer(_videoController),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth / 365.0;
    if (videos.isEmpty && randomIndex == 0) {
      return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(color: Colors.purple),
          ));
    }

    while (randomVideoTitles.isEmpty) {
      // indexUsed = randomVideoIndex();
      randomVideoTitles = createRandomVideoList(videos[indexUsed]['title']!);
    }

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
                    image: Container(
                      height: MediaQuery.of(context).size.height * 0.57,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: buildVideo(context)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    meaning: "¿Qué letra representa la siguiente seña?",
                    title: widget.title,
                    description: 'Selecciona una de las opciones múltiples',
                    index: 0,
                    videoController: _videoController,
                    onChange: moveToNext,
                    sign: randomVideoTitles,
                    cIndex: correctOption),
                Voc1(
                  context: context,
                  image: Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                child: buildVideo(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  meaning: "¿Qué letra representa la siguiente seña?",
                  title: widget.title,
                  description: 'Marca una de las opciones',
                  index: 1,
                  videoController: _videoController,
                  onChange: moveToNext,
                  sign: randomVideoTitles,
                  cIndex: correctOption,
                ),
                Voc1(
                  context: context,
                  image: Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                child: buildVideo(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  meaning: "¿Qué letra representa la siguiente seña?",
                  title: widget.title,
                  description: 'Marca dos de las siguientes opciones',
                  index: 2,
                  videoController: _videoController,
                  onChange: moveToNext,
                  sign: randomVideoTitles,
                  cIndex: correctOption,
                ),
                Voc1(
                  context: context,
                  image: Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                child: buildVideo(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  meaning: "¿Qué letra representa la siguiente seña?",
                  title: widget.title,
                  description: 'Marca dos de las siguientes opciones',
                  index: 3,
                  videoController: _videoController,
                  onChange: moveToNext,
                  sign: randomVideoTitles,
                  cIndex: correctOption,
                ),
                Voc1(
                  context: context,
                  image: Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                child: buildVideo(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  meaning: "¿Qué letra representa la siguiente seña?",
                  title: widget.title,
                  description: 'Marca dos de las siguientes opciones',
                  index: 4,
                  videoController: _videoController,
                  onChange: moveToNext,
                  sign: randomVideoTitles,
                  cIndex: correctOption,
                ),
                Voc1(
                  context: context,
                  image: Container(
                    height: MediaQuery.of(context).size.height * 0.57,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                child: buildVideo(context)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  meaning: "¿Qué letra representa la siguiente seña?",
                  title: widget.title,
                  description: 'Marca dos de las siguientes opciones',
                  index: 5,
                  videoController: _videoController,
                  onChange: moveToNext,
                  sign: randomVideoTitles,
                  cIndex: correctOption,
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
                      // onDotClicked: (index) => _controller.animateToPage(
                      //   index,
                      //   duration: const Duration(milliseconds: 500),
                      //   curve: Curves.ease,
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
