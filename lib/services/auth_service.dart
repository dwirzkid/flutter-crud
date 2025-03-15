import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_project_1/main.dart';
import 'package:crud_project_1/view/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Future<void> signup({
    required String fullName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update displayName user dengan fullName
      await userCredential.user!.updateDisplayName(fullName);
      await userCredential.user!.reload();

      // Tutup loading dialog jika terbuka
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      // Setelah pendaftaran berhasil, 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInView()),
      );
    } on FirebaseAuthException catch (e) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
      Fluttertoast.showToast(
        msg: 'An error occurred. Please try again.',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // Melakukan sign in dengan Firebase
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await Future.delayed(const Duration(seconds: 1));

    
     Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An error occurred. Please try again.',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));

    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
