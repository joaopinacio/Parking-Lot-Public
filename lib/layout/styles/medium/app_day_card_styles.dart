import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/medium/app_day_card_component.dart';

class AppDayCardStyles {
  AppDayCardStyles._();

  /// ### AppDayCardStyles standard
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
  static AppDayCardComponent standard({
    required Behaviour behaviour,
    required String day,
    required String abrevDay,
    required bool isSelected,
    required Function() onTap,
    required bool isFirst,
    required bool isLast,
  }) =>
      AppDayCardComponent(
        behaviour: behaviour,
        day: day,
        abrevDay: abrevDay,
        isSelected: isSelected,
        onTap: onTap,
        isFirst: isFirst,
        isLast: isLast,
      );
}
