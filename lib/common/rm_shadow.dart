import '../file_export.dart';

class RMShadow {
  static BoxShadow simple = BoxShadow(
    color: AppColors.neutralColors0.withOpacity(.3),
    spreadRadius: 0,
    blurRadius: 20,
    offset: const Offset(0, 5),
  );

  static BoxShadow medium = BoxShadow(
    color: AppColors.neutralColors0.withOpacity(.5),
    spreadRadius: 0,
    blurRadius: 30,
    offset: const Offset(0, 12),
  );

  static BoxShadow medium2 = const BoxShadow(
    color: AppColors.neutralColors0,
    spreadRadius: 0,
    blurRadius: 24,
    offset: Offset(4, 8),
  );

  static BoxShadow large = BoxShadow(
    color: AppColors.neutralColors0.withOpacity(.12),
    spreadRadius: 0,
    blurRadius: 32,
    offset: const Offset(4, 16),
  );
}
