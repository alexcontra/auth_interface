import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale3_test/specs/assets.dart';
import 'package:scale3_test/specs/constraints.dart';
import 'package:scale3_test/src/profile/model/controllers/constraints_controller.dart';
import 'package:scale3_test/src/profile/model/logout_api/logout_api.dart';

import '../../../specs/colors.dart';
import '../../../specs/styles.dart';
import '../../components/app_bar/app_bar_view_ui.dart';
import '../../components/buttons/small_regular_button/small_regular_button_view_ui.dart';
import '../../components/profile_data_display/profile_data_view_ui.dart';
import '../model/controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarView(
        hasAction: true,
        hasLeading: true,
        title: '',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: ConstraintsController().isConsideredSmallDevice(context)
                    ? Paddings.P_0
                    : Paddings.P_32,
                bottom: ConstraintsController().isConsideredSmallDevice(context)
                    ? Paddings.P_16
                    : Paddings.P_8),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(Assets.profile),
              ),
            ),
          ),
          Text(
            ProfileController()
                .getUsername(FirebaseAuth.instance.currentUser?.email ?? ''),
            style: GoogleFonts.ubuntu(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.shadedBlack),
          ),
          Padding(
            padding: EdgeInsets.only(top: Paddings.P_8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Romania',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrey),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: Paddings.P_8, right: Paddings.P_8),
                  child: Text(
                    '·',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGrey),
                  ),
                ),
                Text(
                  'ID: ${ProfileController().getUserID(FirebaseAuth.instance.currentUser?.uid ?? '')}',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrey),
                ),
              ],
            ),
          ),
          TextButton(
            child: Text(
              'Edit',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: AppColors.shadedPink,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: ConstraintsController().isConsideredSmallDevice(context)
                    ? Paddings.P_22
                    : Paddings.P_50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallRegularButton(
                  leftPadding: Paddings.P_32,
                  rightPadding: Paddings.P_16,
                  buttonText: 'About Me',
                  onPressed: () {},
                  style: AppStyles.setSocialMediaStyle(AppColors.white),
                  textColor: AppColors.darkGrey,
                ),
                SmallRegularButton(
                  leftPadding: Paddings.P_0,
                  rightPadding: Paddings.P_32,
                  buttonText: 'Log out',
                  onPressed: () async {
                    await LogOutApi().signOutFirebase();
                  },
                  style: AppStyles.setSocialMediaStyle(AppColors.shadedGreen),
                  textColor: AppColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: const ProfileDataView(),
    );
  }
}
