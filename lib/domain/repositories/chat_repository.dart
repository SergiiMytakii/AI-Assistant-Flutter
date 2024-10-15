import 'package:ai_assiatant_flutter/core/errors/failures.dart';
import 'package:ai_assiatant_flutter/domain/entities/chat/chat_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatMessage>> sendMessage({required String message});
  Future<void> receiveMessage({required String message});

  Future<Either<Failure, ChatMessage>> sendInitialMessage();
  // Future<void> getMessages({required String message});
}
