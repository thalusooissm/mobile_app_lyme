import 'package:flutter/cupertino.dart';

class FontTheme {
  static CupertinoTextThemeData customTextTheme = CupertinoTextThemeData(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: 'SFPro',
    ),
    actionTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'SFPro',
    ),
    tabLabelTextStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'SFPro',
    ),
    navTitleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
    ),
    navLargeTitleTextStyle: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      fontFamily: 'SFPro',
    ),
    pickerTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: 'SFPro',
    ),
    dateTimePickerTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: 'SFPro',
    ),
  );

  static CupertinoThemeData appTheme = CupertinoThemeData(
    textTheme: customTextTheme,
    primaryColor: CupertinoColors.activeBlue,
  );

  // Custom additional text styles
  static Map<String, TextStyle> customStyles = {
    'title1Emphasized': TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontFamily: 'SFPro',
    ),
    'title2Emphasized': TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      fontFamily: 'SFPro',
    ),

    'title2Regular': TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      fontFamily: 'SFPro',
    ),


    'title3Emphasized': TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
    ),

    'headlineRegular': TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
    ),
    'bodyRegular': TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      fontFamily: 'SFPro',
    ),
    'subheadlineRegular': TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: 'SFPro',
    ),

        'subheadlineEmphasized': TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
    ),

    'caption1Regular': TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'SFPro',
    ),

        'caption2Regular': TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      fontFamily: 'SFPro',
    ),

    'caption1Emphasized': TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
    ),
      'footnoteEmphasized': TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
    ),
      'footnoteRegular': TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      fontFamily: 'SFPro',
    ),
      'calloutEmphasized': TextStyle(
      fontSize:16,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFPro',
    ),



  };
}


// import 'package:flutter/material.dart';

// class FontTheme {
//   static TextTheme customTextTheme = TextTheme(
//     headline1: TextStyle(
//         fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'SFPro'),
//     headline2: TextStyle(
//         fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'SFPro'),
//     bodyText1: TextStyle(
//         fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'SFPro'),
//     bodyText2: TextStyle(
//         fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'SFPro'),
//   );

//   static ThemeData appTheme = ThemeData(
//     textTheme: customTextTheme,
//   );
// }


// import 'colors.dart';
// import 'package:flutter/material.dart';

// abstract final claass AppTheme {
//   static const _textTheme = TextTheme(
//     largeTitleRegular: TextStyle(
//       fontSize: 34,
//       fontWeight: FontWeight.w400,
//     ),
//     largeTitleEmphasized: TextStyle(
//       fontSize: 34,
//       fontWeight: FontWeight.w600,
//     ),
//     headlineSmall: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w400,
//     ),
//     titleMedium: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w500,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w400,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 16,
//       fontWeight: FontWeight.w400,
//     ),
//     bodySmall: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: AppColors.grey3,
//     ),
//     labelSmall: TextStyle(
//       fontSize: 10,
//       fontWeight: FontWeight.w500,
//       color: AppColors.grey3,
//     ),
//     labelLarge: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w400,
//       color: AppColors.grey3,
//     ),
//   );

//   static const _inputDecorationTheme = InputDecorationTheme(
//     hintStyle: TextStyle(
//       // grey3 works for both light and dark themes
//       color: AppColors.grey3,
//       fontSize: 18.0,
//       fontWeight: FontWeight.w400,
//     ),
//   );

//   // static ThemeData lightTheme = ThemeData(
//   //   useMaterial3: true,
//   //   brightness: Brightness.light,
//   //   colorScheme: AppColors.lightColorScheme,
//   //   textTheme: _textTheme,
//   //   inputDecorationTheme: _inputDecorationTheme,
//   //   extensions: [
//   //     TagChipTheme(
//   //       chipColor: AppColors.whiteTransparent,
//   //       onChipColor: Colors.white,
//   //     ),
//   //   ],
//   // );

//   // static ThemeData darkTheme = ThemeData(
//   //   useMaterial3: true,
//   //   brightness: Brightness.dark,
//   //   colorScheme: AppColors.darkColorScheme,
//   //   textTheme: _textTheme,
//   //   inputDecorationTheme: _inputDecorationTheme,
//   //   extensions: [
//   //     TagChipTheme(
//   //       chipColor: AppColors.blackTransparent,
//   //       onChipColor: Colors.white,
//   //     ),
//   //   ],
//   // );
// }
