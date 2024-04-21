// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Meditation extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Meditation> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/meditation.mp4')
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
                                child: const Icon(
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
                     'Meditation is a powerful practice that has numerous benefits for mental health. By incorporating meditation into our daily routine, we can experience a sense of calmness and inner peace, reducing stress and anxiety levels. Through focused attention and mindfulness, meditation helps us become more aware of our thoughts and emotions, fostering emotional regulation and resilience. It promotes positive changes in brain structure and function, enhancing cognitive abilities and memory. Moreover, meditation has been shown to improve sleep quality, boost self-esteem, and cultivate a more positive outlook on life. Regular meditation practice can also alleviate symptoms of depression and promote overall well-being. By taking time to connect with our inner selves through meditation, we pave the way for enhanced mental clarity, emotional balance, and a more harmonious state of mind.' 
                    ,style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
