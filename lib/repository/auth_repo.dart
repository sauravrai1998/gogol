import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/profile.dart';
import '../utils/constants.dart';

class AuthRepo {
  AuthRepo._privateConstructor();
  static final AuthRepo instance =
  AuthRepo._privateConstructor();

  Future<void> createFirestoreProfile(ProfileModel user) async {
    try {
      await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.email).set({
        'id': firebaseAuth.currentUser!.uid,
        'name': user.username,
        'email': firebaseAuth.currentUser!.email,
        'imageUrl': user.imageUrl,
        'managerName': user.username,
        'phoneNumber': user.mobile,
      });
    } catch (e) {
      rethrow;
    }
  }

  Stream<DocumentSnapshot> userStream(String? emailId) {
    return firebaseFirestore.collection('users').doc(emailId).snapshots();
  }

}