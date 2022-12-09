import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../specs/colors.dart';
import '../../../../specs/constraints.dart';
import '../../../../specs/styles.dart';

class RegularButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  const RegularButton(
      {required this.onPressed, required this.buttonText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Paddings.P_32, right: Paddings.P_32),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: Heights.H_60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: AppStyles.setButtonStandardStyle(AppColors.shadedGreen),
          child: Text(buttonText,
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white)),
        ),
      ),
    );
  }
}
