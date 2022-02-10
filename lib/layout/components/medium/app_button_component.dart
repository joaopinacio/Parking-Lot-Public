import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppButtonComponent extends StatelessWidget with Component {
  /// ### AppButtonComponent
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
  /// __[twoButtons]__ Boolean para visualizar dois botoes
  ///
  /// __[onTapSecondButton]__ Funcao de clique do segundo botao
  ///
  /// __[backgroundColorSecondButton]__ Cor de fundo do segundo botao
  ///
  /// __[iconSecondButton]__ Icone do segundo botao
  ///
  /// __[widthSecondButton]__ Largura do botao do segundo botao
  ///
  final Behaviour behaviour;
  final Widget child;
  final Function()? onTap;
  final Color? backgroundColor;
  final IconData? icon;
  final double? width;
  final double? height;
  final double? radius;
  final bool? twoButtons;
  final Function()? onTapSecondButton;
  final Color? backgroundColorSecondButton;
  final IconData? iconSecondButton;
  final double? widthSecondButton;

  const AppButtonComponent({
    Key? key,
    required this.behaviour,
    required this.child,
    this.onTap,
    this.backgroundColor,
    this.icon,
    this.width,
    this.height,
    this.radius,
    this.twoButtons = false,
    this.onTapSecondButton,
    this.backgroundColorSecondButton,
    this.iconSecondButton,
    this.widthSecondButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return twoButtons!
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: child,
                style: TextButton.styleFrom(
                  backgroundColor: backgroundColor ?? AppThemes.colors.primaryColor,
                  primary: Colors.black,
                  minimumSize: Size(width?.w ?? 125.w, height?.h ?? 25.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius?.r ?? 10.r)),
                  ),
                ),
                onPressed: onTap,
              ),
              SizedBox(width: 5.w),
              TextButton(
                child: Icon(iconSecondButton, size: 20.sp, color: AppThemes.colors.secondaryBlack),
                style: TextButton.styleFrom(
                  backgroundColor: backgroundColorSecondButton ?? AppThemes.colors.primaryColor,
                  primary: Colors.black,
                  minimumSize: Size(widthSecondButton?.w ?? 55.w, height?.h ?? 25.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius?.r ?? 10.r)),
                  ),
                ),
                onPressed: onTapSecondButton,
              ),
            ],
          )
        : TextButton(
            child: child,
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor ?? AppThemes.colors.primaryColor,
              primary: Colors.black,
              minimumSize: Size(width?.w ?? 125.w, height?.h ?? 25.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius?.r ?? 10.r)),
              ),
            ),
            onPressed: onTap,
          );
  }
}
