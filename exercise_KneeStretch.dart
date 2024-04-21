// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class KneeStretch extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<KneeStretch> {
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/KneeStretch.mp4')
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
                  'The Knee Stretch exercise, also known as the Seated Knee Flexor Stretch, is a beneficial practice that can positively impact mental health. As we engage in this stretching routine, we allow ourselves to focus on our bodies and be present in the moment. By mindfully stretching our knee muscles, we release physical tension and discomfort, which can have a direct impact on our emotional well-being. This exercise encourages relaxation and a sense of serenity, as we become attuned to our breath and bodily sensations. The act of dedicating time to care for our physical health through simple exercises like the Knee Stretch can have profound effects on our mental state. As we move and stretch, endorphins are released, promoting a boost in mood and a reduction in stress and anxiety. Overall, incorporating the Knee Stretch into our daily routine offers a holistic approach to mental health, fostering a deeper connection between our mind and body'
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
