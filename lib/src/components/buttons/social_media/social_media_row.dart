import 'package:flutter/material.dart';
import 'package:scale3_test/specs/assets.dart';
import 'package:scale3_test/specs/constraints.dart';
import 'package:scale3_test/src/components/buttons/social_media/social_media_button_view_ui.dart';

class SocialMediaMenuRow extends StatelessWidget {
  const SocialMediaMenuRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Paddings.P_32, right: Paddings.P_32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SocialMediaButton(onPressed: () {}, buttonAsset: Assets.facebook),
          SocialMediaButton(onPressed: () {}, buttonAsset: Assets.twitter),
          SocialMediaButton(onPressed: () {}, buttonAsset: Assets.linkedin)
        ],
      ),
    );
  }
}
