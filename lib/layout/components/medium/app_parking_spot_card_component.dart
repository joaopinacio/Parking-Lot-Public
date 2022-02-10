import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';
import 'dart:math' as math;

class AppParkingSpotCardComponent extends StatelessWidget with Component {
  /// ### AppParkingSpotCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[label]__ Label do card
  ///
  /// __[isSelected]__ Se esta selecionado
  ///
  /// __[onTap]__ Funcao de clique
  ///
  /// __[isLeft]__ Se o Card é o da esquerda
  ///
  /// __[imagePath]__ Imagem do veiculo
  ///
  final Behaviour behaviour;
  final String label;
  final bool isSelected;
  final Function() onTap;
  final bool isLeft;
  final String imagePath;

  const AppParkingSpotCardComponent({
    Key? key,
    required this.behaviour,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.isLeft,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            left: isLeft ? BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp) : BorderSide.none,
            right: isLeft ? BorderSide.none : BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
            top: BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
            bottom: BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 13.h),
              decoration: BoxDecoration(
                color: isSelected ? AppThemes.colors.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            Container(
              color: Colors.transparent,
              width: 100.w,
              height: 25.h,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isLeft ? 0 : math.pi),
                child: Image.asset(
                  imagePath,
                  scale: 1.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget whenEmpty(BuildContext context, Behaviour childBehaviour) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.w, 13.h, 10.w, 13.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            left: isLeft ? BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp) : BorderSide.none,
            right: isLeft ? BorderSide.none : BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
            top: BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
            bottom: BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppThemes.colors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(15.r),
          ),
          width: 100.w,
          height: 25.h,
          child: Center(
            child: label != ''
                ? Text(
                    label,
                    style: AppThemes.typography.zonaProBold_18.copyWith(
                      color: isSelected ? AppThemes.colors.secondaryBlack : AppThemes.colors.secondaryBlue,
                    ),
                  )
                : Icon(
                    Icons.add_rounded,
                    color: AppThemes.colors.primaryColor,
                    size: 35.sp,
                  ),
          ),
        ),
      ),
    );
  }

  @override
  Widget whenBlocked(BuildContext context, Behaviour childBehaviour) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.w, 13.h, 10.w, 13.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            left: isLeft ? BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp) : BorderSide.none,
            right: isLeft ? BorderSide.none : BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
            top: BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
            bottom: BorderSide(color: AppThemes.colors.opaqueGrayScale_2, width: 1.sp),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppThemes.colors.primaryColor : AppThemes.colors.grayScale_3,
            borderRadius: BorderRadius.circular(10.r),
          ),
          width: 100.w,
          height: 25.h,
          child: Icon(
            Icons.lock_rounded,
            color: isSelected ? AppThemes.colors.secondaryBlack : AppThemes.colors.grayScale_2,
            size: 22.sp,
          ),
        ),
      ),
    );
  }
}
