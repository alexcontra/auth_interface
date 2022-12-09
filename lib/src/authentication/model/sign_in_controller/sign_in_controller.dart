import 'package:get/state_manager.dart';

///[SignInController] state management controll for sign in phase
class SignInController extends GetxController {
  ///[isLoading] will observe if the process is loading, if not will proceed with next state
  RxBool isLoading = false.obs;

  ///[isError] will observe if the process got an error
  RxBool isError = false.obs;
}
