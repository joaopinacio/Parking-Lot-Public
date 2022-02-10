import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';
import 'package:parking_lot/core/classes/behaviour.dart';

class AppBarComponent extends StatelessWidget with Component implements PreferredSizeWidget {
  /// ### AppBarComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[title]__ Titulo
  ///
  /// __[actions]__ Lista de Widgets que irão apareceu ao lado do Title
  ///
  /// __[backgroundColor]__ Cor de fundo
  ///
  final Behaviour behaviour;
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Widget? leading;

  const AppBarComponent({
    Key? key,
    required this.behaviour,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return AppBar(
      foregroundColor: Colors.white,
      backgroundColor: backgroundColor ?? AppThemes.colors.white,
      automaticallyImplyLeading: false,
      leading: leading,
      title: title,
      actions: actions,
      elevation: 0,
      leadingWidth: 25.w,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
