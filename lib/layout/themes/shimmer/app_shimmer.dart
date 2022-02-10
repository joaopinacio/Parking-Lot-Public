import 'package:parking_lot/layout/app_layout_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer {
  static final highlightColor = AppThemes.colors.white;
  static final baseColor = AppThemes.colors.grayScale_1;

  standard({required Widget child}) => Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: child,
      );

  rectangle({required double height, required double width}) => Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: Container(
          height: height,
          width: width,
          color: AppThemes.colors.white,
        ),
      );

  circle({required double size}) => Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          height: size.sp,
          width: size.sp,
        ),
      );
}
