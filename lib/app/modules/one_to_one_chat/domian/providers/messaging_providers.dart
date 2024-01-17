import 'package:connect_app/app/modules/one_to_one_chat/domian/providers/controller/messages_notifer.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/providers/state/message_chat_state.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/repo/messaging_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final massegingRepoProvider = Provider<MessagingRepo>(
  (ref) => MessagingRepo(),
);

final chatMessageProvider =
    StateNotifierProvider<ChatMessageStateNotifer, MessageChatState>(
  (ref) => ChatMessageStateNotifer(
    MessageChatState(),
  ),
);
//final messageRepoInstance = MessagingRepo();
