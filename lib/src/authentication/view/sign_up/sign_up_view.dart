import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale3_test/src/authentication/model/sign_up_controller/sign_up_controller.dart';
import 'package:scale3_test/src/authentication/view/sign_in/sign_in_view.dart';
import 'package:scale3_test/src/profile/view/profile_view.dart';

import '../../../../specs/assets.dart';
import '../../../../specs/colors.dart';
import '../../../../specs/constraints.dart';
import '../../../../specs/styles.dart';
import '../../../components/app_bar/app_bar_view_ui.dart';
import '../../../components/bottom_navigation/bottom_navigation_authentication_view_ui.dart';
import '../../../components/buttons/regular_button/regular_button_view_ui.dart';
import '../../../components/buttons/social_media/social_media_row.dart';
import '../../../components/text_fields/text_field_view.dart';
import '../../model/register_api/register_api.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKeyRegister = GlobalKey<FormBuilderState>();
  final _signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKeyRegister,
      child: Obx(
        () => _signUpController.isLoading.value
            ? const Scaffold(
                backgroundColor: AppColors.white,
                body: Center(child: CircularProgressIndicator()),
              )
            : Scaffold(
                backgroundColor: AppColors.white,
                appBar: AppBarView(
                  hasAction: true,
                  hasLeading: true,
                  title: 'Sign Up',
                ),
                body: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Paddings.P_60, bottom: Paddings.P_32),
                      child: Center(child: Image.asset(Assets.signUpLogo)),
                    ),
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
                        onChanged: (value) {
                          _signUpController.passwordValue.value = value ?? '';
                        },
                        textInputAction: TextInputAction.done,
                        style: Theme.of(context).textTheme.subtitle1,
                        validator: FormBuilderValidators.required(),
                        decoration: AppStyles().textFieldStandardDecoration(
                            'Password', 'password', const Text(''), context),
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.only(bottom: Paddings.P_16),
                        child: CustomTextField(
                          asset: '',
                          topPadding: Paddings.P_16,
                          sidePadding: Paddings.P_32,
                          textFieldType: FormBuilderTextField(
                            name: 'repassword',
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onSubmitted: (value) {
                              // _formKey.currentState!.saveAndValidate();
                            },
                            textInputAction: TextInputAction.done,
                            style: Theme.of(context).textTheme.subtitle1,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.equal(
                                  _signUpController.passwordValue.value,
                                  errorText: "Passwords doesn't match"),
                            ]),
                            decoration: AppStyles().textFieldStandardDecoration(
                                'Confirm password',
                                'confirm password',
                                const Text(''),
                                context),
                          ),
                        ),
                      ),
                    ),
                    RegularButton(
                        buttonText: 'Sign Up',
                        onPressed: () async {
                          if (_formKeyRegister.currentState!
                              .saveAndValidate()) {
                            await RegisterUser().userRegistration(
                                email: _formKeyRegister
                                    .currentState?.fields['email']?.value,
                                password: _formKeyRegister
                                    .currentState?.fields['password']?.value);
                            if (!_signUpController.isErrorRegister.value) {
                              Get.to(() => const ProfileView());
                            }
                          }
                        }),
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
                  buttonText: 'Sign In',
                  onPressed: () {
                    Get.offAll(() => const SignInView());
                  },
                  question: "Already have an account?",
                ),
              ),
      ),
    );
  }
}
