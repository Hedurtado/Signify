import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  final String imageUrl;
  const LottieAnimation({super.key, required this.imageUrl});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    _composition = AssetLottie(widget.imageUrl).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        var composition = snapshot.data;
        if (composition != null) {
          return Lottie(composition: composition);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
