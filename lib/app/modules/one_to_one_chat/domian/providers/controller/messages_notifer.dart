import 'dart:io';

import 'package:connect_app/app/modules/one_to_one_chat/domian/providers/state/message_chat_state.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/repo/messaging_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ChatMessageStateNotifer extends StateNotifier<MessageChatState> {
  ChatMessageStateNotifer(super.state);

  final MessagingRepo _messagingRepo = MessagingRepo();
  final picker = ImagePicker();

  Future<void> sendMessage({
    required String senderId,
    required String recieverId,
    required String message,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      await _messagingRepo.sendMessage(
          senderId: senderId, recieverId: recieverId, message: message);
      state = state.copyWith(isLoading: false, message: "");
    } catch (e) {
      state =
          state.copyWith(error: e.toString(), isLoading: false, message: "");
    }
  }

  Future upLoadFile({
    required File file,
    required String senderId,
    required String recieverId,
  }) async {
    final fileName = basename(file.path);
    final destination = "file/$fileName";

    try {
      final reference = FirebaseStorage.instance.ref(destination);
      reference.putFile(file).then((recievedFile) async {
        final downloadedUrl = await recievedFile.ref.getDownloadURL();
        await sendMessage(
            senderId: senderId, recieverId: recieverId, message: downloadedUrl);
      });
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
