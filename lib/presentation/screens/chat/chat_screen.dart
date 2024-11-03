import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:ai_assiatant_flutter/injection.dart';
import 'package:ai_assiatant_flutter/main.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/animated_progress_indicator.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/horisontal_list_view.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/image_card.dart';
import 'package:ai_assiatant_flutter/presentation/screens/chat/widget/text_message_card.dart';
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
    getIt<ChatCubit>().getInitialLanguage();
    super.initState();
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      getIt<ChatCubit>().sendMessage(message);
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
      child: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Chat with AI Assistant'.tr()),
            actions: [_buildLanguageWidget(state)],
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [_buildMessages(state), _buildTypingWidget(state)],
              )),
              _buildSuggestions(state),
              _buildInputField(),
            ],
          ),
        );
      }),
    );
  }

  ListView _buildMessages(ChatState state) {
    return ListView.builder(
      reverse: true,
      itemCount: state.messages.length,
      itemBuilder: (context, index) {
        final message = state.messages.reversed.toList()[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.text.isNotEmpty) TextMessage(message: message),
            if (message.videos != null && message.videos!.isNotEmpty)
              VideoCard(message: message),
            if (message.images != null && message.images!.isNotEmpty)
              ImageCard(message: message),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Positioned _buildTypingWidget(ChatState state) {
    return Positioned(
      bottom: 0,
      left: 16,
      child: state.isLoading ? const AnimatedDots() : const SizedBox.shrink(),
    );
  }

  Padding _buildInputField() {
    return Padding(
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
                _sendMessage(_controller.text);

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
            onPressed: () => _sendMessage(_controller.text),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestions(ChatState state) {
    return HorizontalListView(
      children: state.suggestions.map((suggestion) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
          child: RawChip(
            padding: const EdgeInsets.all(4.0),
            label: Text(suggestion),
            onPressed: () => _sendMessage(suggestion),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLanguageWidget(ChatState state) {
    final List<String> languages = languagesCodes.keys.toList();
    return Row(
      children: [
        const SizedBox(width: 16),
        const Icon(Icons.language),
        const SizedBox(width: 6),
        DropdownButton<String>(
          elevation: 0,
          underline: null,
          value: state.language,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) async {
            if (newValue != null) {
              getIt<ChatCubit>().changeLanguage(newValue);
              await context.setLocale(Locale(newValue));
              await prefs.setString('language', newValue);
            }
          },
          items: languages.map<DropdownMenuItem<String>>((String value) {
            // if (value != _selectedLanguage) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(context.tr(value)),
            );
            // }
          }).toList(),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}

const testMessage = ChatMessage(
    text:
        ' sdlfkjsdfj sdfjsd ;flkjslkfdj s;dkfkjs d;lkfj sdkfj sdlkfj sdl;jfdsl;kjf',
    isUserMessage: false,
    images: [
      Resource(
          url:
              'https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          caption: 'some caption'),
      Resource(
          url:
              'https://firebasestorage.googleapis.com/v0/b/ai-consultant-4137b.appspot.com/o/images%2FIMG_7388.jpg?alt=media&token=0d72bfbf-6e7b-46dd-b550-fe35ed56b3fb',
          caption:
              'some caption skdlfhsdfj sdfjdslfjdslfjsdf jdsfj dsfj lsfdskjf sdfkjsdjfsdfjsd sljfdsjf dslkjf')
    ],
    videos: [
      Resource(
          url:
              'https://www.youtube.com/watch?v=oMFhQD7DztM&list=PLw6SJ6q6-1YpD_mAuJTfyFveCD5x5sEXW&index=14',
          caption: 'some caption ldkfjdjfskjdfd sfkljdsf sdf'),
      Resource(
          url:
              'https://www.youtube.com/watch?v=oMFhQD7DztM&list=PLw6SJ6q6-1YpD_mAuJTfyFveCD5x5sEXW&index=14',
          caption: 'some caption'),
    ]);
