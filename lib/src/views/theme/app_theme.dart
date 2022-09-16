import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';
import 'app_size.dart';

class AppTheme{
  static ThemeData appTheme = ThemeData(
    fontFamily: 'SVN-Poppins',
    brightness: Brightness.light,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColor.content.withOpacity(0.8),
      elevation: 1,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: TextStyle(
          color: AppColor.backgroundLight,
          fontWeight: FontWeight.w400,
          fontSize: AppSize.textBase
      ),
    ),
    splashColor: AppColor.accent100,
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          shadowColor: Colors.white,
          // color: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          )

      ),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
      textTheme: TextTheme(
        bodyText2: TextStyle(

        ),

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedIconTheme: IconThemeData(
            color: Colors.blue
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none
          ),
          contentPadding: EdgeInsets.all(10.0)
      ),
      scaffoldBackgroundColor: Colors.white
  );

}