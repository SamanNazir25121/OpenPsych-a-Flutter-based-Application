// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Breath extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Breath> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/breath.mp4')
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
                  'The Deep Breath exercise, also known as Diaphragmatic Breathing or Belly Breathing, is a simple yet profound practice that can significantly impact mental health. By taking deep, intentional breaths that engage the diaphragm, we activate the body relaxation response, which helps to alleviate stress and anxiety. Deep breathing calms the nervous system, leading to a sense of tranquility and emotional balance. This exercise is particularly effective in moments of heightened emotions or overwhelming thoughts, as it provides a grounding anchor to the present moment. The act of focusing on our breath allows us to cultivate mindfulness, as we become attuned to our body and sensations. Regular practice of the Deep Breath exercise can improve overall well-being, boost cognitive function, and promote better sleep. By incorporating this breathing technique into our daily routine, we empower ourselves with a valuable tool for self-care and emotional resilience, fostering a greater sense of calmness and inner peace.'
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
