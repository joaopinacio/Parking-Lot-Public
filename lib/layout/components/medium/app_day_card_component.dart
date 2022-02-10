import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppDayCardComponent extends StatelessWidget with Component {
  /// ### AppDayCardComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[day]__ Dia a ser exibido
  ///
  /// __[abrevDay]__ Abreviacao do nome do dia da semana
  ///
  /// __[isSelected]__ Se o card está selecionado
  ///
  /// __[onTap]__ Funcao de clique
  ///
  /// __[isFirst]__ Se é o primeiro da Lista
  ///
  /// __[isLast]__ Se é o ultimo da lista
  ///
  final Behaviour behaviour;
  final String day;
  final String abrevDay;
  final bool isSelected;
  final Function() onTap;
  final bool isFirst;
  final bool isLast;

  const AppDayCardComponent({
    Key? key,
    required this.behaviour,
    required this.day,
    required this.abrevDay,
    required this.isSelected,
    required this.onTap,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Padding(
      padding: EdgeInsets.only(left: isFirst ? 14.w : 0, right: isLast ? 14.w : 0),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: 45.w,
          height: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: (isSelected ? AppThemes.colors.secondaryBlue : AppThemes.colors.opaqueGrayScale_2_15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                day,
                style: AppThemes.typography.zonaProSemiBold_14.copyWith(
                  color: (isSelected ? AppThemes.colors.white : AppThemes.colors.secondaryBlack),
                ),
              ),
              Text(
                abrevDay,
                style: AppThemes.typography.zonaProRegular_10.copyWith(
                  color: (isSelected ? AppThemes.colors.white : AppThemes.colors.grayScale_2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
