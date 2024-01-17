// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageChatState {
  final bool isLoading;
  final String message;
  final String fileMEssage;
  final String? error;

  MessageChatState({
    this.isLoading = false,
    this.message = "",
    this.fileMEssage = "",
    this.error,
  });

  MessageChatState copyWith({
    bool? isLoading,
    String? message,
    String? fileMessage,
    String? error,
  }) {
    return MessageChatState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      error: error ?? this.error,
      fileMEssage: fileMEssage ?? this.fileMEssage,
    );
  }
}
