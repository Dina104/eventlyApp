import 'package:evently/core/resourese/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButtom extends StatelessWidget {
  const CustomTextButtom({super.key , required this.textfield, required this.onTap , this.textAlign =TextAlign.center});
  final String textfield;
  final VoidCallback onTap;
  final TextAlign textAlign ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        textAlign: textAlign,
        textfield,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: ColorsManager.blue,
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.blue,
          textStyle: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
