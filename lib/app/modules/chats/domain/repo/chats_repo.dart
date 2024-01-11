import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_app/app/modules/chats/domain/models/user_model.dart';

class ChatsRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<UserModel>> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot =
          await _firebaseFirestore.collection('users').get();

      List<UserModel> usersList = querySnapshot.docs
          .map((e) => UserModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
      return usersList;
    } catch (e) {
      throw e.toString();
    }
  }
}
