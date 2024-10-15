import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    super.key,
    required this.message,
  }) : assert(message.imageUrls != null && message.imageUrls!.isNotEmpty);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: message.imageUrls!
          .map((imageUrl) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.7,
                      color: Colors.grey[300],
                      child: fullScreenHeroWidget(imageUrl)),
                ),
              ))
          .toList(),
    );
  }

  Widget fullScreenHeroWidget(String imageUrl) => FullScreenWidget(
        disposeLevel: DisposeLevel.Low,
        child: Hero(
          tag: "customTag",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
