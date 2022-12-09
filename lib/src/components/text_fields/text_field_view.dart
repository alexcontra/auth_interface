// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String asset;
  final double topPadding;
  final double sidePadding;
  final Widget textFieldType;
  const CustomTextField(
      {required this.asset,
      required this.topPadding,
      required this.sidePadding,
      required this.textFieldType,
      super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: widget.topPadding,
                left: widget.sidePadding,
                right: widget.sidePadding),
            child: widget.textFieldType,
          ),
        ],
      ),
    );
  }
}
