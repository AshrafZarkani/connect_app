import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LocationRepo {
  final _firestore = FirebaseFirestore.instance;

  updateUserLocation(
      {required double latitude, required double longitue}) async {
    try {
      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        "latitude": latitude,
        "longitude": longitue,
      });
    } catch (e) {
      throw e.toString();
    }
  }
}

final locationRepo = LocationRepo();
