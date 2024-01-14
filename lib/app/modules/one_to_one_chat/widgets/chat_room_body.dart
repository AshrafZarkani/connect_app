import 'package:connect_app/app/core/extensions/build_context_extinsion.dart';
import 'package:connect_app/app/modules/chats/domain/models/user_model.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/models/message.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/providers/messaging_providers.dart';
import 'package:connect_app/app/modules/one_to_one_chat/domian/repo/messaging_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRoomPageBody extends ConsumerStatefulWidget {
  const ChatRoomPageBody({super.key, required this.userModel});

  final UserModel userModel;
  @override
  ConsumerState<ChatRoomPageBody> createState() => _ChatRoomPageBodyState();
}

class _ChatRoomPageBodyState extends ConsumerState<ChatRoomPageBody> {
  final _sendMessageController = TextEditingController();

  @override
  void dispose() {
    _sendMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageRepo = ref.watch(massegingRepoProvider);
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: messageRepo.getAllMessage(
              senderId: currentUserId,
              recieverId: widget.userModel.id,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              final List<Message> messageList = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: messageList.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment:
                          currentUserId == messageList[index].senderId
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            color: currentUserId == messageList[index].senderId
                                ? Colors.amber
                                : Colors.blue,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Text(
                                  messageList[index].message.toString(),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(messageList[index].timeStamp.toString())
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _sendMessageController,
                  decoration:
                      const InputDecoration(hintText: 'Type your message'),
                ),
              ),
              IconButton(
                onPressed: () async {
                  try {
                    await messageRepo
                        .sendMessage(
                      senderId: currentUserId,
                      recieverId: widget.userModel.id,
                      message: _sendMessageController.text,
                    )
                        .whenComplete(() {
                      _sendMessageController.clear();
                    });
                  } catch (e) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      context.showSnackbar(
                        'Error sending message: $e',
                      );
                    });
                  }
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        )
      ],
    );
  }
}
