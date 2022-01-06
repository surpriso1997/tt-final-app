import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(
            child: Column(),
          ),
// SliverList(delegate: delegate)
// SliverGrid(delegate: delegate, gridDelegate: gridDelegate),
// SliverAnimatedList(itemBuilder: itemBuilder),

          // RenderBox
          // RenderSliver
        ],
      ),
    );
  }
}
