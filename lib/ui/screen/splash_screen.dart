import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        "https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4")
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? PageView.builder(
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
                alignment: Alignment.topCenter, child: buildVideo());
          })
      : Center(child: CircularProgressIndicator());

  Widget buildVideo() {
    final size = controller.value.size;
    final width = size.width;
    final height = size.height;
    final _height = MediaQuery.of(context).size.height;

    return Container(
      height: _height,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: width,
          height: height,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}
