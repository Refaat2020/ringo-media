import 'package:ringo_media/file_export.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColors.neutralColors100,
    brightness: Brightness.light,
    fontFamily: "urbanist",
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.neutralColors900,
        fontSize: 24.sp,
      ),
      //18.sp
      displayMedium: TextStyle(
        color: AppColors.neutralColors900,
        fontSize: 18.sp,
      ),
      displaySmall: TextStyle(
        color: AppColors.neutralColors500,
        fontSize: 12.sp,
      ),
      bodyLarge: TextStyle(
        color: AppColors.neutralColors900,
        fontSize: 16.sp,
      ),
      bodySmall: TextStyle(
        color: AppColors.neutralColors900,
        fontSize: 14.sp,
      ),
    ),
  );
}
