// ignore_for_file: unused_field

import 'package:logger/logger.dart';

mixin LoggerMixin {
  final Logger _logger = Logger();

  void showLogsInfo(String message) {
    _logger.i(message);
  }

  void showLogsDebug(String message) {
    _logger.d(message);
  }

  void showLogsError(String message) {
    _logger.e(message);
  }
}
