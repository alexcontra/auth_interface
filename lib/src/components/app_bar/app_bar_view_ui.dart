import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale3_test/specs/assets.dart';

import '../../../specs/colors.dart';
import '../../../specs/constraints.dart';

class AppBarView extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final bool hasLeading;
  final bool hasAction;
  final double appBarHeight = Heights.H_64;
  AppBarView(
      {required this.title,
      required this.hasLeading,
      required this.hasAction,
      super.key});

  @override
  State<AppBarView> createState() => _AppBarViewState();

  @override
  Size get preferredSize => Size(double.infinity, appBarHeight);
}

class _AppBarViewState extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: widget.hasLeading
          ? Padding(
              padding: EdgeInsets.only(left: Paddings.P_8),
              child: Row(
                children: [
                  SizedBox(
                    width: Paddings.P_32,
                    child: IconButton(
                      splashRadius: 0.1,
                      padding: EdgeInsets.only(left: Paddings.P_8),
                      iconSize: 45,
                      icon: SvgPicture.asset(
                        Assets.backArrow,
                        color: AppColors.shadedBlack,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            )
          : null,
      centerTitle: true,
      title: widget.title.isNotEmpty
          ? Text(widget.title,
              style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: AppColors.shadedBlack))
          : null,
      actions: widget.hasAction
          ? [
              Padding(
                padding: EdgeInsets.only(right: Paddings.P_8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        splashRadius: 0.1,
                        iconSize: 45,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          Assets.menu,
                          color: AppColors.shadedBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          : null,
    );
  }
}
