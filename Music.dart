import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MusicPlayerPage extends StatelessWidget {
  final List<String> youtubeVideoUrls = [
    //'https://www.youtube.com/watch?v=ndiOMiFcfB4',
    'https://youtu.be/GJd7Q-KMllg',
    'https://youtu.be/K93d63k1TRk',
    'https://youtu.be/_KFsJvgPfHg',

    // Add more video URLs as needed
  ];

  MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: ListView.builder(
        itemCount: youtubeVideoUrls.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Music Track ${index + 1}'),
            onTap: () {
              _playYoutubeVideo(context, youtubeVideoUrls[index]);
            },
          );
        },
      ),
    );
  }

  void _playYoutubeVideo(BuildContext context, String videoUrl) {
    String videoId = YoutubePlayer.convertUrlToId(videoUrl)!;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Now Playing'),
          ),
          body: Center(
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: videoId,
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              progressColors: ProgressBarColors(
                playedColor: Colors.blue,
                handleColor: Colors.blueAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
