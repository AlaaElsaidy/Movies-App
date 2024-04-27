import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/utilies/appColors.dart';

class AppStyles{
  static ThemeData lightStyle(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0,
      ),
      textTheme: TextTheme(
        bodyMedium:GoogleFonts.inter(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400
        ),
        bodyLarge: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400
        ),
        bodySmall: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400
        ), displaySmall:
        GoogleFonts.inter(
            color: AppColors.grayColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400
        ),
      )
    );
  }
}