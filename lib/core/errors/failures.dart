import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_template/flavors.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  @override
  final String? errorMessage = '';

  const factory Failure.serverError({String? errorMessage}) = ServerError;
  const factory Failure.networkError({String? errorMessage}) = NetworkError;
  const factory Failure.authenticationError({String? errorMessage}) =
      AuthenticationError;
  const factory Failure.openAiError({String? errorMessage}) = OpenAiError;
  const factory Failure.notFound({String? errorMessage}) = NotFound;
  const factory Failure.unknown({String? errorMessage}) = Unknown;
  const factory Failure.internal({String? errorMessage}) = InternalError;

  String toUserFriendlyMessage() {
    return when(
      serverError: (errorMessage) =>
          'Server error. Please check your internet connection and try again.'
              .tr() +
          _devMessage(errorMessage),
      authenticationError: (errorMessage) =>
          'Authentication error. '.tr() + (errorMessage ?? ''),
      networkError: (errorMessage) =>
          'Network error. Please check your internet connection.'.tr() +
          _devMessage(errorMessage),
      notFound: (errorMessage) =>
          'The requested resource was not found.'.tr() +
          _devMessage(errorMessage),
      unknown: (errorMessage) =>
          'An unknown error occurred. Please try again later. If the error persists, please contact the developer.'
              .tr() +
          _devMessage(errorMessage),
      openAiError: (errorMessage) =>
          'ChatGpt error. Please try again later.'.tr() +
          _devMessage(errorMessage),
      internal: (errorMessage) =>
          'Internal app error. Please try again later. If the error persists, please contact the developer.'
              .tr() +
          _devMessage(errorMessage),
    );
  }

  String _devMessage(String? errorMessage) {
    if (errorMessage != null &&
        errorMessage.isNotEmpty &&
        F.appFlavor == Flavor.dev) {
      return ' (Dev message: $errorMessage)';
    }
    return '';
  }

  const Failure._();
}
