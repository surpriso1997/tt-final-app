import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tok_app/bloc/video/video_cubit.dart';
import 'package:tik_tok_app/model/video.dart';
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

  final VideoCubit videoCubit = VideoCubit();
  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.network(
    //     "https://assets.mixkit.co/videos/preview/mixkit-waves-in-the-water-1164-large.mp4")
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((_) => controller.play());

    videoCubit.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: videoCubit,
        builder: (context, state) {
          print(state);
          
          if (state is VideosLoading) {
            return CircularProgressIndicator(strokeWidth: 2);
          } else if (state is VideosError) {
            return Center(
              child: Text("An error has occurred"),
            );
          } else if (state is VideoNoData) {
            return Center(child: Text("There are no videos available"));
          } else if (state is VideosFetchSuccess) {
            final hits = state.data;

            return PageView.builder(
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  print("page index is : $index");

                  videoCubit.loadMoreVideos();
                },
                itemBuilder: (context, index) {
                  Hit videoHit = hits[index];

                  return BetterPlayer.network(videoHit.videos.small.url);
                });
          } else if (state is VideoLoadingMoreData) {
            final hits = state.data;

            return PageView.builder(
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  print("page index is : $index");

                  if (hits.length - index == 5) {
                    videoCubit.loadMoreVideos();
                  }
                },
                itemBuilder: (context, index) {
                  Hit videoHit = hits[index];

                  return BetterPlayer.network(videoHit.videos.small.url);
                });
          }

          return Container();
        },
      ),
    );
    // return controller.value.isInitialized
    //     ? PageView.builder(
    //         itemCount: 5,
    //         scrollDirection: Axis.vertical,
    //         itemBuilder: (context, index) {
    //           return Container(
    //               alignment: Alignment.topCenter, child: buildVideo());
    //         })
    //     : Center(child: CircularProgressIndicator());
  }

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
