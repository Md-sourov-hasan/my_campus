import 'package:flutter/material.dart';

/// Custom responsive sizing utility using MediaQuery.
/// Designed for mobile-first layouts based on a 375×812 design reference.
const double designWidth = 375;
const double designHeight = 812;

class Sizer {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal;
  static late double _blockSizeVertical;

  static void init(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    _screenWidth = size.width;
    _screenHeight = size.height;
    _blockSizeHorizontal = _screenWidth / designWidth;
    _blockSizeVertical = _screenHeight / designHeight;
  }

  /// Responsive width
  static double w(double width) => width * _blockSizeHorizontal;

  /// Responsive height
  static double h(double height) => height * _blockSizeVertical;

  /// Responsive font size
  static double sp(double fontSize) => fontSize * _blockSizeHorizontal;

  /// Responsive radius
  static double r(double radius) => radius * _blockSizeHorizontal;

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;

  /// Vertical spacing widget
  static Widget verticalSpace(double height) =>
      SizedBox(height: h(height));

  /// Horizontal spacing widget
  static Widget horizontalSpace(double width) =>
      SizedBox(width: w(width));
}

/// Extension methods for ergonomic responsive sizing.
extension SizerExt on num {
  double get w => Sizer.w(toDouble());
  double get h => Sizer.h(toDouble());
  double get sp => Sizer.sp(toDouble());
  double get r => Sizer.r(toDouble());

  Widget get verticalSpace => Sizer.verticalSpace(toDouble());
  Widget get horizontalSpace => Sizer.horizontalSpace(toDouble());
}
