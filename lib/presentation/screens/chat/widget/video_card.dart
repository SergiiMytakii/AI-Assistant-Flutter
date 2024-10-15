import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoCard extends StatefulWidget {
  final ChatMessage message;
  VideoCard({
    super.key,
    required this.message,
  }) : assert(message.videoUrls != null && message.videoUrls!.isNotEmpty);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
        child: Column(
          children: widget.message.videoUrls!
              .map(
                (url) => GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => VideoPlayer(videoId: getVideoId(url)),
                  ),
                  child: Image.network(
                    YoutubePlayerController.getThumbnail(
                        videoId: getVideoId(url), webp: false),
                    height: 200,
                    width: 200 * 16 / 9,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

String getVideoId(
  String link,
) {
  //if you use Youtube_player or youtube iFrame player
  if (link.isNotEmpty && link.contains('yout')) {
    try {
      return YoutubePlayerController.convertUrlToId(link) ?? '';
    } on Exception catch (e, stackTrace) {
      logger.e(e, stackTrace: stackTrace);

      return '';
    }
  } else {
    return link;
    // log.v(videoId);
  }
}
