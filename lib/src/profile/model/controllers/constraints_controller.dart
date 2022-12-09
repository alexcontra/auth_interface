import 'package:flutter/material.dart';

class ConstraintsController {
  bool isConsideredSmallDevice(BuildContext context) =>
      MediaQuery.of(context).size.height < 800 ? true : false;
}
