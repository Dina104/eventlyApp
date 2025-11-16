import 'package:evently/core/resourese/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class ThemeManager {
  static final ThemeData light = ThemeData(
    iconTheme: IconThemeData(color: ColorsManager.black),
    cardTheme: CardThemeData(
      color: ColorsManager.Whiteblue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      )
    ),

    primaryColor: ColorsManager.blue,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.Whiteblue,
      foregroundColor: ColorsManager.blue,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.Whiteblue,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.Whiteblue,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.Whiteblue, width: 4),
      ),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(
      color: ColorsManager.blue,
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.Whiteblue,
      unselectedItemColor: ColorsManager.Whiteblue,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.gray, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.gray, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.gray,
      ),
      prefixIconColor: ColorsManager.gray,
      suffixIconColor: ColorsManager.gray,
    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.Whiteblue,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: ColorsManager.Whiteblue,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.blue,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.black,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsManager.blue,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsManager.blue,
      ),

      bodySmall: (GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500)),
    ),
  );
  static final ThemeData dark = ThemeData(
    cardTheme: CardThemeData(
       color: ColorsManager.black20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )
    ),


    iconTheme: IconThemeData(color: ColorsManager.ofWhite),
    primaryColor: ColorsManager.blue,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black20,
      foregroundColor: ColorsManager.black20,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.ofWhite,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.ofWhite, width: 4),
      ),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(
      color: ColorsManager.black,
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.ofWhite,
      unselectedItemColor: ColorsManager.ofWhite,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
      ),
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      hintStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),
      prefixIconColor: ColorsManager.ofWhite,
      suffixIconColor: ColorsManager.ofWhite,

    ),
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.ofWhite,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: ColorsManager.ofWhite,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.blue,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorsManager.ofWhite,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsManager.ofWhite,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsManager.blue,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsManager.ofWhite,
      ),

      bodySmall: (GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.Whiteblue,
      )),
    ),
  );

  //static final ThemeData dark = ThemeData();
}
