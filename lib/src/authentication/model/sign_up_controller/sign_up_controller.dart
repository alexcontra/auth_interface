import 'package:get/get.dart';

class SignUpController extends GetxController {
  ///[isLoading] will observe if the process is loading, if not will proceed with next state
  RxBool isLoading = false.obs;

  ///[isErrorRegister] will observe if the process got an error
  RxBool isErrorRegister = false.obs;

  ///[passwordValue] will observe and if the [confirmPassword] field has the same value
  /// will validate
  RxString passwordValue = ''.obs;
}
