import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoCard extends StatefulWidget {
  final ChatMessage message;
  VideoCard({super.key, required this.message})
      : assert(message.videos != null && message.videos!.isNotEmpty);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.message.videos!
          .map(
            (video) => GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) =>
                    VideoPlayer(videoId: getVideoId(video.url)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://cors-anywhere.herokuapp.com/${YoutubePlayerController.getThumbnail(videoId: getVideoId(video.url), webp: false)}',
                          ),
                          height: 200,
                          width: 200 * 16 / 9,
                          fit: BoxFit.fitWidth,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            logger.e(error, stackTrace: stackTrace);
                            return Container(
                                height: 200,
                                width: 200 * 16 / 9,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ));
                          },
                        ),
                        if (video.caption != null) const SizedBox(height: 8),
                        if (video.caption != null) Text(video.caption!)
                      ],
                    ),
                    const Positioned.fill(
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  String getVideoId(String url) {
    // Extract the video ID from the URL
    final uri = Uri.parse(url);
    return uri.queryParameters['v'] ?? uri.pathSegments.last;
  }
}
