import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/main.dart';
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: message.imageUrls!
          .map((imageUrl) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: 300,
                        maxWidth: 300,
                        minWidth: 150,
                        minHeight: 150),
                    child: fullScreenHeroWidget(imageUrl)),
              ))
          .toList(),
    );
  }

  Widget fullScreenHeroWidget(String imageUrl) => FullScreenWidget(
        disposeLevel: DisposeLevel.Low,
        child: Hero(
          tag: imageUrl,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
