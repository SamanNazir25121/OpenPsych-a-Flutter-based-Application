
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ArmSwing extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<ArmSwing> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/ArmSwing.mp4')
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
        title: const Text('OPEN PSYCH'),
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
                : const CircularProgressIndicator(),
            const SizedBox(height: 20),
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'The Arm Swing exercise is a refreshing and invigorating practice that can greatly benefit mental health. As we swing our arms, we engage in a rhythmic movement that promotes a sense of release and freedom. This exercise encourages deep breathing and relaxation, allowing us to let go of stress and tension. The repetitive motion of the Arm Swings can have a calming effect on the mind, helping to reduce anxiety and promote a more positive outlook. Moreover, this exercise stimulates blood flow and oxygenation to the brain, enhancing cognitive function and mental clarity. As we move our arms with intention and awareness, we become more present in the moment, fostering mindfulness and a greater connection with our bodies. Incorporating Arm Swing exercises into our daily routine can be a valuable tool for improving mental well-being, providing a moment of rejuvenation and emotional balance amidst the challenges of daily life.'
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
