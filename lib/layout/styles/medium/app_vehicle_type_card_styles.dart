import 'package:flutter/material.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/medium/app_vehicle_type_card_component.dart';

class AppVehicleTypeCardStyles {
  AppVehicleTypeCardStyles._();

  /// ### AppVehicleTypeCardStyles standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[imagePath]__ Caminho da Imagem
  ///
  /// __[label]__ Texto de Referencia
  ///
  /// __[isSelected]__ Se está selecionado
  ///
  static AppVehicleTypeCardComponent standard({
    required Behaviour behaviour,
    required String imagePath,
    required String label,
    required bool isSelected,
    required Color backgroundColor,
  }) =>
      AppVehicleTypeCardComponent(
        behaviour: behaviour,
        imagePath: imagePath,
        label: label,
        isSelected: isSelected,
        backgroundColor: backgroundColor,
      );
}
