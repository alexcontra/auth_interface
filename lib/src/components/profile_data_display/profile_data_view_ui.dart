import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scale3_test/specs/assets.dart';
import 'package:scale3_test/specs/constraints.dart';
import 'package:scale3_test/src/components/profile_data_display/profile_data_container_view_ui.dart';

import '../../../specs/colors.dart';
import '../../profile/model/controllers/constraints_controller.dart';

class ProfileDataView extends StatelessWidget {
  const ProfileDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConstraintsController().isConsideredSmallDevice(context)
          ? MediaQuery.of(context).size.height * 0.43
          : MediaQuery.of(context).size.height * 0.47,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: AppColors.shadedBlack),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileDataContainer(
            label: 'Phone number',
            content: '+40753699881',
            asset: Assets.phone,
            topPadding: Paddings.P_40,
            bottomPadding: Paddings.P_16,
          ),
          ProfileDataContainer(
            label: 'Email',
            content: FirebaseAuth.instance.currentUser?.email ?? '',
            asset: Assets.email,
            topPadding: Paddings.P_0,
            bottomPadding: Paddings.P_16,
          ),
          ProfileDataContainer(
            label: 'Completed projects',
            content: '47',
            asset: Assets.completed,
            topPadding: Paddings.P_0,
            bottomPadding: Paddings.P_0,
          ),
        ],
      ),
    );
  }
}
