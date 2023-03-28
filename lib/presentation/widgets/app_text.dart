import 'package:fflow_test_app/presentation/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;

  const AppText({
    super.key,
    required this.text,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope().copyWith(
        color: AppColors.primaryHighlight,
        fontWeight: fontWeight,
      ),
    );
  }
}
