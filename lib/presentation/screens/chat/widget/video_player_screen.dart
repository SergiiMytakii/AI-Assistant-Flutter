// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayer extends StatefulWidget {
  VideoPlayer({
    required this.videoId,
    super.key,
  }) {
    WakelockPlus.enable();
  }

  final String videoId;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
    youtubePlayerController.loadVideoById(videoId: widget.videoId);
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: youtubePlayerController,
      autoFullScreen: false,
      builder: (BuildContext context, Widget player) {
        return player;
      },
    );
  }
}
