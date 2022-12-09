import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../specs/colors.dart';

class BottomNavigationAuthentication extends StatefulWidget {
  final String question;
  final String buttonText;
  final void Function() onPressed;
  const BottomNavigationAuthentication(
      {required this.question,
      required this.buttonText,
      required this.onPressed,
      super.key});

  @override
  State<BottomNavigationAuthentication> createState() =>
      _BottomNavigationAuthenticationState();
}

class _BottomNavigationAuthenticationState
    extends State<BottomNavigationAuthentication> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.question,
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.darkGrey),
          ),
          TextButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.buttonText,
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.shadedPink,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid),
            ),
          )
        ],
      ),
    );
  }
}
