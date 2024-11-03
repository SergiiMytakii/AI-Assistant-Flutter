import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    super.key,
    required this.message,
  }) : assert(message.images != null && message.images!.isNotEmpty);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: message.images!
          .map((image) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                    minWidth: 150,
                  ),
                  child: Column(
                    children: [
                      fullScreenHeroWidget(image.url),
                      if (image.caption != null) const SizedBox(height: 8),
                      if (image.caption != null) Text(image.caption!)
                    ],
                  ),
                ),
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
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 320, maxWidth: 300, minWidth: 150, minHeight: 170),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ));
}
