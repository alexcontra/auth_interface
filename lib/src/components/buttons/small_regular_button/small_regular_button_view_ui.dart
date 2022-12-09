import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../specs/constraints.dart';

class SmallRegularButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final double leftPadding;
  final double rightPadding;
  final Color textColor;
  final ButtonStyle style;
  const SmallRegularButton(
      {required this.onPressed,
      required this.buttonText,
      required this.leftPadding,
      required this.rightPadding,
      required this.textColor,
      required this.style,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: SizedBox(
        width: Widths.W_150,
        height: Heights.H_60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: Text(buttonText,
              style: GoogleFonts.roboto(
                  fontSize: 16, fontWeight: FontWeight.w900, color: textColor)),
        ),
      ),
    );
  }
}
