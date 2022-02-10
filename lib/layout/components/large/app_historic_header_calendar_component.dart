import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/app_layout_imports.dart';
import 'package:parking_lot/layout/styles/medium/app_medium_styles.dart';

class AppHistoricHeaderCalendarComponent extends StatelessWidget with Component {
  /// ### AppHistoricHeaderCalendarComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[monthName]__ Nome do mês
  ///
  /// __[day]__ Dia a ser exebido
  ///
  /// __[totalQty]__ Quantidade total
  ///
  /// __[entryQty]__ Quantidade de entradas
  ///
  /// __[departureQty]__ Quantidade de saidas
  ///
  /// __[onTap]__ Funcao de clique para abrir o calendario
  ///
  final Behaviour behaviour;
  final String monthName;
  final String day;
  final String totalQty;
  final String entryQty;
  final String departureQty;
  final Function() onTap;

  const AppHistoricHeaderCalendarComponent({
    Key? key,
    required this.behaviour,
    required this.monthName,
    required this.day,
    required this.totalQty,
    required this.entryQty,
    required this.departureQty,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 11.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$monthName, $day',
                style: AppThemes.typography.zonaProExtraBold_20,
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    entryQty == '1' ? '$entryQty ${'entry'.tr}' : '$entryQty ${'entries'.tr}',
                    style: AppThemes.typography.zonaProSemiBold_12.copyWith(
                      color: AppThemes.colors.secondaryBlue,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '-',
                    style: AppThemes.typography.zonaProRegular_12.copyWith(
                      color: AppThemes.colors.secondaryBlack,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    departureQty == '1' ? '$departureQty ${'departure'.tr}' : '$departureQty ${'departures'.tr}',
                    style: AppThemes.typography.zonaProSemiBold_12.copyWith(
                      color: AppThemes.colors.secondaryRed,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                totalQty == '1' ? '$totalQty ${'register'.tr}' : '$totalQty ${'registers'.tr}',
                style: AppThemes.typography.zonaProRegular_12.copyWith(
                  color: AppThemes.colors.grayScale_2,
                ),
              ),
            ],
          ),
          AppButtonStyles.standard(
            behaviour: Behaviour.regular,
            backgroundColor: AppThemes.colors.secondaryBlack,
            width: 42,
            height: 38,
            child: Icon(
              Icons.calendar_today_rounded,
              size: 16.sp,
              color: AppThemes.colors.white,
            ),
            radius: 40,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
