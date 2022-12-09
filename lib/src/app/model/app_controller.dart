import 'package:flutter/material.dart';
import 'package:scale3_test/src/authentication/view/sign_in/sign_in_view.dart';
import 'package:scale3_test/src/profile/view/profile_view.dart';

class AppController {
  ///[navigateToCurrentState] maintain the user authenticated if the instance is not null
  Widget navigateToCurrentState(String? uid) =>
      uid!.isEmpty ? const SignInView() : const ProfileView();
}
