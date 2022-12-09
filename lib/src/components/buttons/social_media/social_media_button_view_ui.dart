import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../specs/colors.dart';
import '../../../../specs/constraints.dart';
import '../../../../specs/styles.dart';

class SocialMediaButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonAsset;
  const SocialMediaButton(
      {required this.onPressed, required this.buttonAsset, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Widths.W_100,
      height: Heights.H_60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: AppStyles.setSocialMediaStyle(AppColors.white),
          child: SvgPicture.asset(buttonAsset)),
    );
  }
}
