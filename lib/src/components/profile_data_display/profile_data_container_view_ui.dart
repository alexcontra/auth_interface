import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale3_test/specs/constraints.dart';

import '../../../specs/colors.dart';

class ProfileDataContainer extends StatelessWidget {
  final String label;
  final String content;
  final String asset;
  final double topPadding;
  final double bottomPadding;
  const ProfileDataContainer(
      {required this.label,
      required this.content,
      required this.asset,
      required this.topPadding,
      required this.bottomPadding,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding,
          right: Paddings.P_32,
          left: Paddings.P_32,
          bottom: bottomPadding),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: Heights.H_80,
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.lightGrey)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Paddings.P_27),
              child: Center(child: SvgPicture.asset(asset)),
            ),
            SizedBox(
              height: Heights.H_42,
              child: const Center(
                child: VerticalDivider(
                  thickness: 1,
                  color: AppColors.lightGrey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Paddings.P_22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: Paddings.P_8),
                    child: Text(
                      label,
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGrey),
                    ),
                  ),
                  Text(
                    content,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
