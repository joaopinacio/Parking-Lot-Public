import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppHistoricCardComponent extends StatelessWidget with Component {
  /// ### AppHistoricCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[imagePath]__ Caminho da Imagem
  ///
  /// __[imageBackgroundColor]__ Cor de fundo da imagem
  ///
  /// __[title]__ Titulo do card
  ///
  /// __[subtitle]__ Subitulo do card
  ///
  /// __[threelineTitle]__ Terceiro subtitulo
  ///
  /// __[status]__ Status do card
  ///
  /// __[statusColor]__ Cor do status
  ///
  /// __[time]__ Tempo passado
  ///
  /// __[hours]__ Horas do dia
  ///
  final Behaviour behaviour;
  final String imagePath;
  final Color imageBackgroundColor;
  final String title;
  final String subtitle;
  final String threelineTitle;
  final String status;
  final Color statusColor;
  final String? time;
  final String hours;

  const AppHistoricCardComponent({
    Key? key,
    required this.behaviour,
    required this.imagePath,
    required this.imageBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.threelineTitle,
    required this.status,
    required this.statusColor,
    this.time,
    required this.hours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: imageBackgroundColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(6.sp),
                child: Image.asset(
                  imagePath,
                  scale: 10.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppThemes.typography.zonaProBold_15,
              ),
              SizedBox(height: 3.h),
              Text(
                subtitle,
                style: AppThemes.typography.zonaProSemiBold_12.copyWith(
                  color: AppThemes.colors.secondaryBlack,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                threelineTitle,
                style: AppThemes.typography.zonaProSemiBold_12.copyWith(
                  color: AppThemes.colors.grayScale_2,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: AppThemes.typography.zonaProBold_15.copyWith(
                  color: statusColor,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                time ?? '--',
                style: AppThemes.typography.zonaProSemiBold_12.copyWith(
                  color: AppThemes.colors.secondaryBlack,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                hours,
                style: AppThemes.typography.zonaProSemiBold_12.copyWith(
                  color: AppThemes.colors.grayScale_2,
                ),
              ),
            ],
          ),
          if (statusColor == AppThemes.colors.secondaryRed) SizedBox(width: 5.w),
        ],
      ),
    );
  }
}
