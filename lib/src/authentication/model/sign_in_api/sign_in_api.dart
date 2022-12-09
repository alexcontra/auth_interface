// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../usage/logger/logger_mixin.dart';
import '../sign_in_controller/sign_in_controller.dart';

class SignInUser with LoggerMixin {
  ///[userSignIn] stand for sign in with email & password service
  Future<void> userSignIn(
      {required String email, required String password}) async {
    final SignInController signInController = Get.find();
    signInController.isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      showLogsInfo(
          "User authenticated with \n email: ${userCredential.user?.email} \n uid: ${userCredential.user?.uid}");
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Something went wrong', e.code);
      showLogsError("Error ${e.code}");
      signInController.isError.value = true;
      rethrow;
    } finally {
      signInController.isLoading.value = false;
    }
  }
}
