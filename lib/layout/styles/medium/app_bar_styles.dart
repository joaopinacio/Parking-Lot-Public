import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/widgets/app_anim_search_bar_component.dart';
import 'package:parking_lot/layout/components/medium/app_bar_component.dart';
import 'package:parking_lot/layout/styles/medium/app_button_styles.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppBarStyles {
  AppBarStyles._();

  /// ### AppBarStyles standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[title]__ Titulo
  ///
  /// __[actions]__ Lista de Widgets que irão apareceu ao lado do Title
  ///
  /// __[backgroundColor]__ Cor de fundo
  ///
  static AppBarComponent standard({
    required Behaviour behaviour,
    Widget? title,
    List<Widget>? actions,
    Color? backgroundColor,
  }) =>
      AppBarComponent(
        behaviour: behaviour,
        title: title,
        actions: actions,
        backgroundColor: backgroundColor,
      );

  /// ### AppBarStyles onlyTitle
  ///
  /// __[title]__ Titulo
  ///
  static AppBarComponent onlyTitle({
    required String title,
  }) {
    return AppBarComponent(
      behaviour: Behaviour.regular,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Text(
          title,
          style: AppThemes.typography.zonaProBold_18,
        ),
      ),
    );
  }

  /// ### AppBarStyles onlyTitle
  ///
  /// __[title]__ Titulo
  ///
  /// __[onTapBack]__ Funcao de clique do botao a esquerda
  ///
  static AppBarComponent titleWithBack({
    required String title,
    required Function() onTapBack,
    required TextEditingController textController,
    bool? isSearchOpen = false,
    required Function(bool) onTapSearch,
  }) {
    return AppBarComponent(
      behaviour: Behaviour.regular,
      title: Visibility(
        visible: !isSearchOpen!,
        child: Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTapBack,
              child: Padding(
                padding: EdgeInsets.only(right: 12.w, top: 10.h, bottom: 10.h),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: AppThemes.colors.secondaryBlack,
                  size: 25.sp,
                ),
              ),
            ),
            Text(
              title,
              style: AppThemes.typography.zonaProBold_18,
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: AppAnimSearchBarComponent(
            color: AppThemes.colors.secondaryBlack,
            style: AppThemes.typography.zonaProSemiBold_16.copyWith(
              color: AppThemes.colors.white,
            ),
            autoFocus: true,
            width: 340.w,
            helpText: 'search'.tr,
            closeSearchOnSuffixTap: true,
            textController: textController,
            rtl: true,
            onSuffixTap: () {
              textController.clear();
            },
            callbackStatus: onTapSearch,
          ),
        ),
      ],
    );
  }

  /// ### AppBarStyles onlyTitle
  ///
  /// __[title]__ Titulo
  ///
  /// __[onTap]__ Funcao de clique do botao a direita
  ///
  static AppBarComponent titleWithButton({
    required String title,
    required Function() onTap,
  }) {
    return AppBarComponent(
      behaviour: Behaviour.regular,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Text(
          title,
          style: AppThemes.typography.zonaProBold_18,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: AppButtonStyles.standard(
            behaviour: Behaviour.regular,
            width: 25,
            height: 25,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.history_rounded,
              size: 25.sp,
              color: AppThemes.colors.secondaryBlack,
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
