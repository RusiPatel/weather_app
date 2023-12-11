import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontColor = AppColors.whiteColor,
      this.fontSize = 20,
      this.fontWeight = FontWeight.normal});

  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: fontColor, fontSize: fontSize, fontWeight: fontWeight)));
  }
}
