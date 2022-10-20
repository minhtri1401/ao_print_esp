import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  static const imgBarCode = 'assets/icons/bar_code.png';
  static const imgQrCode = 'assets/icons/qr_code.png';
  static const imgReceipt = 'assets/icons/receipt.png';
  static const imgLogo = 'assets/icons/logo.png';
}

class AppColors {
  static const colorDarkJungle = Color(0xFF1E1E21);
  static const colorOnyx = Color(0xFF35393C);
  static const colorArsenic = Color(0xFF3B4044);
  static const colorInchworm = Color(0xFFB7ED57);
  static const colorSilverSand = Color(0xFFC4C4C4);
}

const String fontFamily = 'Futura';

/// Font bold
TextStyle boldSFTextStyle({double? size, Color? color, double? height}) =>
    TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: size ?? 14,
        color: color ?? Colors.black,
        height: height);

/// Font regular
TextStyle regularSFTextStyle({double? size, Color? color, double? height}) =>
    TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size ?? 14,
      color: color ?? Colors.black,
      height: height,
    );

/// Font medium
TextStyle mediumSFTextStyle({double? size, Color? color, double? height}) =>
    TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: size ?? 14,
        color: color ?? Colors.black,
        height: height);
