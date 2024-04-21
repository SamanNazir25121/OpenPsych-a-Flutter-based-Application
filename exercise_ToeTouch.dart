// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ToeTouch extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<ToeTouch> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/ToeTouch.mp4')
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
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                'The Toe Touch exercise is a simple yet powerful practice that can have positive effects on mental health. As we bend forward to touch our toes, we engage in a mindful movement that brings our attention to the present moment. This exercise encourages deep breathing and relaxation, which can help reduce stress and anxiety. By focusing on the stretch and the sensations in our body, we cultivate a sense of mindfulness and inner awareness. The release of physical tension during the Toe Touch exercise can also lead to a release of emotional tension, promoting a sense of calmness and well-being. As we make this simple movement a part of our daily routine, we create an opportunity to connect with ourselves and foster a greater sense of self-care and self-compassion. Overall, the Toe Touch exercise provides a valuable tool for enhancing mental health, nurturing both our physical and emotional well-being.'    
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
