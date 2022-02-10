import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/medium/app_button_component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppButtonStyles {
  AppButtonStyles._();

  /// ### AppButtonStyles standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[child]__ Widget filho
  ///
  /// __[onTap]__ Funcao de clique
  ///
  /// __[backgroundColor]__ Cor de fundo
  ///
  /// __[icon]__ Icone localizado na esquerda
  ///
  /// __[width]__ Largura do botao
  ///
  /// __[height]__ Altura do botao
  ///
  /// __[radius]__ Raio das bordas do botao
  ///
  static AppButtonComponent standard({
    required Behaviour behaviour,
    required Widget child,
    required Function() onTap,
    Color? backgroundColor,
    IconData? icon,
    double? width,
    double? height,
    double? radius,
  }) =>
      AppButtonComponent(
        behaviour: behaviour,
        child: child,
        onTap: onTap,
        backgroundColor: backgroundColor,
        icon: icon,
        width: width,
        height: height,
        radius: radius,
      );

  /// ### AppButtonStyles bookAndBlock
  ///
  /// __[onTap]__ Funcao de clique do primeiro botao
  ///
  /// __[onTapSecondButton]__ Funcao de clique do segundo botao
  ///
  static AppButtonComponent bookAndBlockOrUnblock({
    required Function() onTap,
    required Function() onTapSecondButton,
    required bool blocked,
  }) =>
      AppButtonComponent(
        behaviour: Behaviour.regular,
        twoButtons: true,
        width: 260,
        height: 45,
        child: Text(
          'book_spot'.tr,
          style: AppThemes.typography.zonaProBold_15.copyWith(
            color: blocked ? AppThemes.colors.grayScale_2 : AppThemes.colors.secondaryBlack,
          ),
        ),
        onTap: blocked ? null : onTap,
        backgroundColor: blocked ? AppThemes.colors.grayScale_3 : AppThemes.colors.primaryColor,
        backgroundColorSecondButton: AppThemes.colors.primaryColor,
        onTapSecondButton: onTapSecondButton,
        iconSecondButton: blocked ? Icons.lock_open_rounded : Icons.lock_rounded,
      );
}
