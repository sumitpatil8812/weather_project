import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:weather_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> logingFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  RxBool loader = false.obs;

  Future<void> verifyPhoneNumber() async {
    loader(true);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          // Handle verification completion
          log("Successfully Verify number");
          loader(false);
        },
        verificationFailed: (FirebaseAuthException ex) {
          log(ex.toString());
          Fluttertoast.showToast(
            msg: ex.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          loader(false);
        },
        codeSent: (String? verificationId, int? resendToken) {
          Get.toNamed(Routes.OTPVIEW, arguments: verificationId);
          loader(false);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle auto-retrieval timeout
          loader(false);
        },
        phoneNumber: "+91${phoneController.text.trim()}",
      );
    } catch (e) {
      loader(false);
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      log('Error during phone number verification: $e');
      // Handle the error as needed
    }
  }

  Future<void> verifyOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: Get.arguments,
        smsCode: otpController.text.trim(),
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Get.offAllNamed(Routes.HOME);
        return value;
      });

      User user = userCredential.user!;

      Get.offAllNamed(Routes.HOME);
      otpController.clear();
      phoneController.clear();
      print('User signed in: ${user.uid}');
    } catch (e) {
      print('Error verifying OTP: $e');
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
