import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:scale3_test/specs/colors.dart';

class AppStyles {
  static ButtonStyle setButtonStandardStyle(Color buttonColor) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
    );
  }

  static ButtonStyle setSocialMediaStyle(Color buttonColor) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0),
      side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: AppColors.marginGrey)),
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
    );
  }

  InputDecoration textFieldStandardDecoration(
      String label, String hint, Widget suffixIcon, BuildContext context) {
    return InputDecoration(
        enabledBorder: outlineInputBorder(AppColors.white),
        errorBorder: outlineInputBorder(AppColors.red),
        focusedErrorBorder: outlineInputBorder(AppColors.red),
        disabledBorder: outlineInputBorder(AppColors.lightGrey),
        focusedBorder: outlineInputBorder(AppColors.shadedGreen),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(AppRadius.RADIUS_3)),
        //counterStyle: TextStyle(color: darkModeController.iconColor.value),
        filled: true,
        focusColor: AppColors.shadedGrey,
        fillColor: AppColors.shadedGrey,
        suffixIcon: suffixIcon,
        label: Text(label),
        labelStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.lightGrey),
        hintStyle: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.lightGrey),
        hintText: hint,
        errorStyle: GoogleFonts.roboto(
            fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.red));
  }

  static OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: color,
      width: 2.0,
    ));
  }
}
