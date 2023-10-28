import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:section/screens/screens.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerTemplate extends StatefulWidget {
  final String name;
  const VideoPlayerTemplate({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<VideoPlayerTemplate> {
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
        FirebaseFirestore.instance.collection(widget.name);
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

  Widget buildDotsIndicator(BuildContext context) {
    final int numberOfDots = videos.length.clamp(0, 5);
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: DotsIndicator(
        dotsCount: numberOfDots,
        position: currentIndex % numberOfDots.toDouble(),
        decorator: DotsDecorator(
          spacing: const EdgeInsets.all(15.0),
          size: const Size.square(10.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Widget buildButtonOptions(BuildContext context) {
    final String title;
    if (widget.name == "Videos") {
      title = 'Abecedario';
    } else {
      title = widget.name.substring(0, widget.name.indexOf('_'));
    }
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
                'assets/images/double_left.png',
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
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return Template(
                    title: title,
                    imageAsset: 'assets/home_img/${title.toLowerCase()}.png',
                    language: 'none',
                  );
                })));
                _controller.pause();
                _controller.dispose();
              },
              child: Image.asset(
                'assets/images/home.png',
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
                'assets/images/double_right.png',
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
    final double videoWidth;
    final double videoHeight;
    if (widget.name.contains('lsec')) {
      videoWidth = MediaQuery.of(context).size.width * 0.9;
      videoHeight = MediaQuery.of(context).size.height * 0.5;
    } else {
      videoWidth = MediaQuery.of(context).size.width * 0.7;
      videoHeight = MediaQuery.of(context).size.height * 0.5;
    }
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.03,
      ),
      width: videoWidth,
      height: videoHeight,
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
        "Esta seña es de $videoName",
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDotsIndicator(context),
            buildTitulo(context),
            buildVideo(context),
            buildButtonOptions(context),
          ],
        ),
      ),
    );
  }
}
