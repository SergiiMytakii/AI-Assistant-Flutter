import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

final Logger logger = Logger();

class VideoCard extends StatefulWidget {
  final ChatMessage message;

  const VideoCard({super.key, required this.message});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.message.videoUrls!
          .map(
            (url) => GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => VideoPlayer(videoId: getVideoId(url)),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Stack(
                  children: [
                    Image(
                      image: NetworkImage(
                        'https://cors-anywhere.herokuapp.com/' +
                            YoutubePlayerController.getThumbnail(
                                videoId: getVideoId(url), webp: false),
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
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        logger.e(error, stackTrace: stackTrace);
                        return const SizedBox(
                          height: 200,
                          width: 200 * 16 / 9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                              Text('Failed to load image'),
                            ],
                          ),
                        );
                      },
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
