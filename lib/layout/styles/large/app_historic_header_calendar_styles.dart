import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/large/app_historic_header_calendar_component.dart';

class AppHistoricHeaderCalendarStyles {
  AppHistoricHeaderCalendarStyles._();

  /// ### AppHistoricHeaderCalendarStyles standard
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
  static AppHistoricHeaderCalendarComponent standard({
    required Behaviour behaviour,
    required String monthName,
    required String day,
    required String totalQty,
    required String entryQty,
    required String departureQty,
    required Function() onTap,
  }) =>
      AppHistoricHeaderCalendarComponent(
        behaviour: behaviour,
        monthName: monthName,
        day: day,
        totalQty: totalQty,
        entryQty: entryQty,
        departureQty: departureQty,
        onTap: onTap,
      );
}
