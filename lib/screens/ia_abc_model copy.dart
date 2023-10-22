import 'package:flutter/material.dart';
import 'package:section/screens/screens.dart';
import 'package:camera/camera.dart';
//import '/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    //_initializeCamera();
  }

  void _initializeCamera(cameras) async {
    //final cameras = await availableCameras();
    _controller = CameraController(cameras.last, ResolutionPreset.medium);
    print("reached here");

    await _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  Future<void> _requestCameraPermission() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final status = await Permission.camera.request();
    if (status.isGranted) {
      setState(() {
        _initializeCamera(cameras);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final targetWidth = screenWidth * 0.9;
    final targetHeight = screenHeight * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: Center(
        child: Container(
          width: targetWidth,
          height: targetHeight,
          child: CameraPreview(_controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestCameraPermission,
        child: const Icon(Icons.camera),
      ),
    );
  }
}
/*
class IAAbcModelScreen extends StatefulWidget {
  const IAAbcModelScreen({Key? key}) : super(key: key);

  @override
  IAAbcModelScreenState createState() => IAAbcModelScreenState();
}

class IAAbcModelScreenState extends State<IAAbcModelScreen> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadTFLiteModel();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);
    await _cameraController.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  void _loadTFLiteModel() async {
    await FirebaseModelDownloader.instance.getModel(
        "yourModelName",
        FirebaseModelDownloadType.localModel,
        FirebaseModelDownloadConditions(
          iosAllowsCellularAccess: true,
          iosAllowsBackgroundDownloading: false,
          androidChargingRequired: false,
          androidWifiRequired: false,
          androidDeviceIdleRequired: false,
        ));
  }

  @override
  void dispose() {
    _cameraController.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text('IA ABC Model'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('IA ABC Model'),
      ),
      body: Center(
        child: CameraPreview(_cameraController),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí puedes capturar el video de la cámara y procesarlo con el modelo TFLite
          // Utiliza _cameraController.startImageStream() para obtener los frames de video
          // y Tflite.runModelOnFrame() para ejecutar la inferencia del modelo.
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
*/