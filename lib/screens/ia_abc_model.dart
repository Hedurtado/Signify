import 'package:flutter/material.dart';
import 'package:section/screens/screens.dart';
import 'package:camera/camera.dart';
//import '/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    initializeCamera();
    super.initState();
    //_initializeCamera();
  }

  void initializeCamera() async {
    //final cameras = await availableCameras();
    cameras = await availableCameras();
    cameraController = CameraController(cameras.last, ResolutionPreset.medium,
        enableAudio: false);

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final targetWidth = screenWidth * 1.0;
    final targetHeight = screenHeight * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: FutureBuilder<void>(
        future: cameraController.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Center(
                  child: SizedBox(
                    width: targetWidth,
                    height: targetHeight,
                    child: CameraPreview(cameraController),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Agrega aquí la acción que se ejecutará al hacer clic en el botón
                      },
                      child: const Text('Iniciar Procesamiento'),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 145, 145, 145),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // Aquí se mostrará la salida de la IA
                        child: const Text(
                          'IA output',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
