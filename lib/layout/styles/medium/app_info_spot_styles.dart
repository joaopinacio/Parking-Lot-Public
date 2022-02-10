import 'package:flutter/material.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/medium/app_info_spot_component.dart';

class AppInfoSpotStyles {
  AppInfoSpotStyles._();

  /// ### AppInfoSpotStyles standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[title]__ Titulo
  ///
  /// __[subtitle]__ Subtitulo
  ///
  /// __[titleColor]__ Cor do Titulo
  ///
  /// __[subtitleColor]__ Cor do Subtitulo
  ///
  static AppInfoSpotComponent standard({
    required Behaviour behaviour,
    required String title,
    required String subtitle,
    Color? titleColor,
    Color? subtitleColor,
  }) =>
      AppInfoSpotComponent(
        behaviour: behaviour,
        title: title,
        subtitle: subtitle,
        titleColor: titleColor,
        subtitleColor: subtitleColor,
      );
}
