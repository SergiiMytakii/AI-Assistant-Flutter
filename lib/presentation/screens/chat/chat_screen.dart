import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/animated_progress_indicator.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/image_card.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/video_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/chat/chat_cubit.dart';
import 'package:ai_assiatant_flutter/presentation/bloc/chat/chat_state.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    getIt<ChatCubit>().sendInitialMessage();
    super.initState();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      // getIt<ChatCubit>().sendMessage(_controller.text);
      _controller.clear();
    }
  }

  final border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Colors.grey),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat with AI Assistant'.tr()),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      ListView.builder(
                        reverse: true,
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message =
                              // state.messages.reversed.toList()[index];
                              ChatMessage(
                                  text:
                                      ' sdlfkjsdfj sdfjsd ;flkjslkfdj s;dkfkjs d;lkfj sdkfj sdlkfj sdl;jfdsl;kjf',
                                  isUserMessage: false,
                                  imageUrls: [
                                'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                'https://firebasestorage.googleapis.com/v0/b/ai-consultant-4137b.appspot.com/o/images%2FIMG_7388.jpg?alt=media&token=0d72bfbf-6e7b-46dd-b550-fe35ed56b3fb'
                              ],
                                  videoUrls: [
                                'https://www.youtube.com/watch?v=oMFhQD7DztM&list=PLw6SJ6q6-1YpD_mAuJTfyFveCD5x5sEXW&index=14'
                              ]);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (message.videoUrls != null &&
                                  message.videoUrls!.isNotEmpty)
                                VideoCard(message: message),
                              if (message.imageUrls != null &&
                                  message.imageUrls!.isNotEmpty)
                                ImageCard(message: message),
                              TextMessage(message: message),
                            ],
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 16,
                        child: state.isLoading
                            ? const AnimatedDots()
                            : const SizedBox.shrink(),
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autocorrect: true,
                      autofocus: true,
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: focusNode,
                      onSubmitted: (_) {
                        _sendMessage();
                        focusNode.requestFocus();
                      },
                      decoration: InputDecoration(
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        errorBorder: border,
                        disabledBorder: border,
                        hintText: 'Type message'.tr(),
                        hintStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: message.isUserMessage ? Colors.blueAccent : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isUserMessage ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
