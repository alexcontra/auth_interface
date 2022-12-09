import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scale3_test/src/authentication/view/sign_in/sign_in_view.dart';

import '../../../../usage/logger/logger_mixin.dart';

class LogOutApi with LoggerMixin {
  ///[signOutFirebase] basic sign out function for log out
  Future<void> signOutFirebase() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.to(() => const SignInView());
      showLogsInfo("Signed out");
    } catch (e) {
      showLogsInfo("Error $e");
    }
  }
}
