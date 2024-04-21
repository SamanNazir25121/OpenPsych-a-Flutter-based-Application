// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Running extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/run.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(_videoPlayerListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _videoPlayerListener() {
    if (_controller.value.isPlaying && !_isVideoPlaying) {
      // Video has started playing, hide the play button
      setState(() {
        _isVideoPlaying = true;
      });
    } else if (!_controller.value.isPlaying && _isVideoPlaying) {
      // Video has completed, show the play button again
      setState(() {
        _isVideoPlaying = false;
      });

      // Reset the video position to the beginning
      _controller.seekTo(Duration.zero);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPEN PSYCH'),
      ),
      body: Center(
        child: Column(
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        VideoPlayer(_controller),
                        _isVideoPlaying
                            ? Container() // Hide the play button when video is playing
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    if (!_controller.value.isPlaying) {
                                      _controller.play();
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                      ],
                    ),
                  )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Running is a highly effective exercise for improving mental health. By engaging in regular running sessions, individuals can experience a range of positive mental health benefits. The release of endorphins during running helps to reduce stress levels and promotes a sense of well-being. Moreover, running has been linked to improvements in mood, alleviating symptoms of anxiety and depression. The increased blood flow to the brain during exercise enhances cognitive function, leading to better mental clarity. Accomplishing personal running goals can boost self-esteem and self-confidence, resulting in a more positive self-image. Additionally, running can be a social activity, providing opportunities for social interaction and support. Overall, running fosters mindfulness, relaxation, and improved mental well-being, making it a valuable exercise for mental health maintenance. However, it is crucial to seek professional mental health care if experiencing persistent emotional challenges.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
