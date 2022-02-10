import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/default/app_default_component.dart';

class AppDefaultStyles {
  AppDefaultStyles._();

  /// ### AppTextDefaultStyles standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  static AppDefaultComponent standard({
    required Behaviour behaviour,
  }) =>
      AppDefaultComponent(
        behaviour: behaviour,
      );
}
