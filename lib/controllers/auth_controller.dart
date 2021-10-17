import 'package:app_earn_money/controllers/store_controller.dart';
import 'package:app_earn_money/screens/bottom_navigator.dart';
import 'package:app_earn_money/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final store = Get.put(StoreController());

  Future<void> signUp(String email, String password, String confirm) async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid == true) {
      if (password == confirm) {
        try {
          EasyLoading.show(status: "Loading...");
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) {
            EasyLoading.showSuccess("Sign Up Success.");
            store.sendItem();
            Get.to(() => const LoginScreen());
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            EasyLoading.showError('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            EasyLoading.showError('The account already exists for that email.');
          }
        } catch (e) {
          EasyLoading.showError('$e');
        }
      } else {
        EasyLoading.showError('Password Incorrect!');
      }
    } else {
      EasyLoading.showError('Wrong Email Format!');
    }
  }

  Future<void> signIn(String email, String password, BuildContext context,
      bool checkbox) async {
    EasyLoading.show(status: "Loading...");
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (checkbox == true) {
          prefs.setString('email', email);
          prefs.setString('password', password);
          prefs.setBool("checkbox", true);
        } else {
          prefs.setString('email', "");
          prefs.setString('password', "");
          prefs.setBool("checkbox", false);
        }

        EasyLoading.showSuccess("Sign In Success");
        Get.to(() => const BottomBar());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showError("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError("Wrong password provided for that user.");
      } else {
        EasyLoading.showError("Error");
      }
    }
  }
}
