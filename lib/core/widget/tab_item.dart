import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.selectedTabBgColor,
    required this.selectedTabFgColor,
    required this.UnselectedTabBgColor,
    required this.UnselectedTabFgColor,
    required this.isSelected,
    required this.category,
  });
  final Color selectedTabBgColor;
  final Color selectedTabFgColor;
  final Color UnselectedTabBgColor;
  final Color UnselectedTabFgColor;
  final bool isSelected;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16.h,vertical: 8),
      decoration: BoxDecoration(
        color: isSelected == true ? selectedTabBgColor : UnselectedTabBgColor,
        borderRadius: BorderRadius.circular(36.r),
        border: Border.all(color: selectedTabBgColor, width: 1.w),
      ),
      child: Row(
        children: [
          Icon(
            category.iconData,
            color: isSelected ? selectedTabFgColor : UnselectedTabFgColor,
          ),
          SizedBox(width: 8,),
          Text(
            category.name,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? selectedTabFgColor : UnselectedTabFgColor,
            ),
          ),
        ],
      ),
    );
  }
}
