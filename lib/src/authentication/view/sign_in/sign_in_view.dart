import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale3_test/specs/assets.dart';
import 'package:scale3_test/specs/colors.dart';
import 'package:scale3_test/specs/constraints.dart';
import 'package:scale3_test/src/authentication/model/sign_in_controller/sign_in_controller.dart';
import 'package:scale3_test/src/authentication/view/sign_up/sign_up_view.dart';
import 'package:scale3_test/src/components/text_fields/text_field_view.dart';
import 'package:scale3_test/src/profile/view/profile_view.dart';

import '../../../../specs/styles.dart';
import '../../../components/app_bar/app_bar_view_ui.dart';
import '../../../components/bottom_navigation/bottom_navigation_authentication_view_ui.dart';
import '../../../components/buttons/regular_button/regular_button_view_ui.dart';
import '../../../components/buttons/social_media/social_media_row.dart';
import '../../model/sign_in_api/sign_in_api.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKeySignIn = GlobalKey<FormBuilderState>();
  final _signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKeySignIn,
      child: Obx(
        () => _signInController.isLoading.value
            ? const Scaffold(
                backgroundColor: AppColors.white,
                body: Center(child: CircularProgressIndicator()),
              )
            : Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.white,
                appBar: AppBarView(
                  hasAction: true,
                  hasLeading: false,
                  title: 'Sign In',
                ),
                body: ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: Paddings.P_60, bottom: Paddings.P_32),
                        child: Center(child: Image.asset(Assets.signInLogo))),
                    CustomTextField(
                      asset: '',
                      topPadding: Paddings.P_0,
                      sidePadding: Paddings.P_32,
                      textFieldType: FormBuilderTextField(
                        name: 'email',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSubmitted: (value) {
                          // _formKeyRegister.currentState!.saveAndValidate();
                        },
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.subtitle1,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(),
                          FormBuilderValidators.required(),
                        ]),
                        decoration: AppStyles().textFieldStandardDecoration(
                            'Username',
                            'username@example.com',
                            const Text(''),
                            context),
                      ),
                    ),
                    CustomTextField(
                      asset: '',
                      topPadding: Paddings.P_16,
                      sidePadding: Paddings.P_32,
                      textFieldType: FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSubmitted: (value) {
                          // _formKey.currentState!.saveAndValidate();
                        },
                        textInputAction: TextInputAction.done,
                        style: Theme.of(context).textTheme.subtitle1,
                        validator: FormBuilderValidators.required(),
                        decoration: AppStyles().textFieldStandardDecoration(
                            'Password', 'password', const Text(''), context),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: Paddings.P_32,
                          top: Paddings.P_14,
                          bottom: Paddings.P_50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forgot your password? ',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.darkGrey)),
                        ],
                      ),
                    ),
                    RegularButton(
                      buttonText: 'Login',
                      onPressed: () async {
                        if (_formKeySignIn.currentState!.saveAndValidate()) {
                          await SignInUser().userSignIn(
                              email: _formKeySignIn
                                  .currentState?.fields['email']?.value,
                              password: _formKeySignIn
                                  .currentState?.fields['password']?.value);
                          if (!_signInController.isError.value) {
                            Get.to(() => const ProfileView());
                          }
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Paddings.P_16, bottom: Paddings.P_16),
                      child: Center(
                        child: Text(
                          'or',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.darkGrey),
                        ),
                      ),
                    ),
                    const SocialMediaMenuRow(),
                  ],
                ),
                bottomNavigationBar: BottomNavigationAuthentication(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    Get.to(() => const SignUpView());
                  },
                  question: "Don't have an account?",
                ),
              ),
      ),
    );
  }
}
