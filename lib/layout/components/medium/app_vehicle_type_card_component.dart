import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppVehicleTypeCardComponent extends StatelessWidget with Component {
  /// ### AppVehicleTypeCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[imagePath]__ Caminho da Imagem
  ///
  /// __[label]__ Texto de Referencia
  ///
  /// __[isSelected]__ Se está selecionado
  ///
  /// __[backgroundColor]__ Cor de fundo do veiculo selecionado
  ///
  final Behaviour behaviour;
  final String imagePath;
  final String label;
  final bool isSelected;
  final Color backgroundColor;

  const AppVehicleTypeCardComponent({
    Key? key,
    required this.behaviour,
    required this.imagePath,
    required this.label,
    required this.isSelected,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: isSelected ? backgroundColor : AppThemes.colors.white,
          boxShadow: [
            BoxShadow(
              color: AppThemes.colors.black.withOpacity(0.15),
              blurRadius: 10.r,
              spreadRadius: 5.r,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              scale: 4.5.sp,
            ),
            Text(
              label,
              style: AppThemes.typography.zonaProBold_16.copyWith(
                color: isSelected ? AppThemes.colors.white : AppThemes.colors.secondaryBlack,
              ),
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              width: 100.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: isSelected ? AppThemes.colors.primaryColor : Colors.transparent,
                border: isSelected
                    ? null
                    : Border.all(
                        color: AppThemes.colors.grayScale_2,
                        width: 1.sp,
                      ),
              ),
              child: Icon(
                isSelected ? Icons.check_rounded : Icons.compare_arrows_rounded,
                size: 25.sp,
                color: AppThemes.colors.secondaryBlack,
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
