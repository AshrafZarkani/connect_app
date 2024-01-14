import 'package:connect_app/app/modules/one_to_one_chat/domian/repo/messaging_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final massegingRepoProvider = Provider<MessagingRepo>(
  (ref) => MessagingRepo(),
);
