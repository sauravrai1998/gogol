import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gogol/NavBar.dart';
import 'package:gogol/screens/createAccount1.dart';
import 'package:gogol/screens/login.dart';
import 'package:gogol/screens/splash.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gogol/utils/constants.dart';
import '../widgets/custom_alert.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  RxBool isLoading = false.obs;
  late Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();

    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    print(firebaseUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    print(user == null);
    if (user == null) {
      print('login');
      Timer(
          Duration(seconds: 2),
              () => {
              Get.offAll(() => createAccount1())
              });

    } else {
      print('nav');
      Timer(
          Duration(seconds: 1),
              () => {
              Get.offAll(() => CustomNavBar())
          });

    }
  }

  Future<void> register(String email, String password, BuildContext context) async {
    try {
      isLoading(true);
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading(false);
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      showAlertDialog(context,e.code);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      isLoading(false);
      print("Error: $e");
    }
  }

  Future<void> login(String email, String password, BuildContext context) async {
    try {
      isLoading(true);
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      isLoading(false);
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      showAlertDialog(context,e.code);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      isLoading(false);
      print("Error: $e");
    }
  }

  Future<void> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await firebaseAuth.signOut();
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<dynamic> showAlertDialog(BuildContext context,String content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlert(content: content,title: "Error",);
      },
    );
  }
}
