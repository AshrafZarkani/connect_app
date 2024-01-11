import 'package:connect_app/app/modules/chats/domain/repo/chats_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final chatRepoProvider = Provider((ref) => ChatsRepo());

final fetchUsersProvider = FutureProvider((ref) async {
  ///final chatRepo = ref.watch(chatRepoProvider);

  final repo = ChatsRepo();
  try {
    final userList = await repo.fetchUsers();
    return userList;
  } catch (e) {
    throw e.toString();
  }
});
