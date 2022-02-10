import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/medium/app_parking_spot_card_component.dart';

class AppParkingSpotCardStyles {
  AppParkingSpotCardStyles._();

  /// ### AppParkingSpotCardStyles standard
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
  static AppParkingSpotCardComponent standard({
    required Behaviour behaviour,
    required String label,
    required bool isSelected,
    required Function() onTap,
    required bool isLeft,
    required String imagePath,
  }) =>
      AppParkingSpotCardComponent(
        behaviour: behaviour,
        label: label,
        isSelected: isSelected,
        onTap: onTap,
        isLeft: isLeft,
        imagePath: imagePath,
      );
}
