import 'package:flutter/material.dart';
import 'package:evently_app_app/core/resourese/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButtom extends StatelessWidget {
  const CustomElevatedButtom({super.key,required this.title,required this.onPress});
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.Whiteblue,
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.Whiteblue,
        ),
      ),
      onPressed: onPress,
      child: Text(title),
    );
  }
}
