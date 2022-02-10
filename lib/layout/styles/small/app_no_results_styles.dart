import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/app_layout_imports.dart';
import 'package:parking_lot/layout/components/small/app_no_results_component.dart';

class AppNoResultsStyles {
  AppNoResultsStyles._();

  /// ### AppNoResultsStyles standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[imagePath]__ Caminho da imagem a ser exibida
  ///
  /// __[title]__ Titulo a ser exibido
  ///
  static AppNoResultsComponent standard({
    required Behaviour behaviour,
    required String imagePath,
    required String title,
  }) =>
      AppNoResultsComponent(
        behaviour: behaviour,
        imagePath: imagePath,
        title: title,
      );

  /// ### AppNoResultsStyles main
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  static AppNoResultsComponent main({
    required Behaviour behaviour,
  }) =>
      AppNoResultsComponent(
        behaviour: behaviour,
        imagePath: AppThemes.images.noResults,
        title: 'no_results'.tr,
      );
}
