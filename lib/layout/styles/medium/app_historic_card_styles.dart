import 'package:flutter/material.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/medium/app_historic_card_component.dart';

class AppHistoricCardStyles {
  AppHistoricCardStyles._();

  /// ### AppHistoricCardStyles standard
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
  static AppHistoricCardComponent standard({
    required Behaviour behaviour,
    required String imagePath,
    required Color imageBackgroundColor,
    required String title,
    required String subtitle,
    required String threelineTitle,
    required String status,
    required Color statusColor,
    String? time,
    required String hours,
  }) =>
      AppHistoricCardComponent(
        behaviour: behaviour,
        imagePath: imagePath,
        imageBackgroundColor: imageBackgroundColor,
        title: title,
        subtitle: subtitle,
        threelineTitle: threelineTitle,
        status: status,
        statusColor: statusColor,
        time: time,
        hours: hours,
      );
}
