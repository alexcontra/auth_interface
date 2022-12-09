// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scale3_test/src/profile/view/profile_view.dart';

import '../../../../usage/logger/logger_mixin.dart';
import '../sign_up_controller/sign_up_controller.dart';

class RegisterUser with LoggerMixin {
  ///[userRegistration] stands for register the user with email & password service
  Future<void> userRegistration(
      {required String email, required String password}) async {
    final SignUpController signInController = Get.find();
    signInController.isLoading.value = true;
    try {
      UserCredential userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      ///Show logs for [userCredentials]
      showLogsInfo(
          "User created \n ${userCredentials.user?.email}: $email \n accessToken: ${userCredentials.credential?.accessToken}");
      Get.to(() => const ProfileView());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Something went wrong', e.code);
      showLogsError("Error ${e.code}");
    } finally {
      signInController.isLoading.value = false;
    }
  }
}
