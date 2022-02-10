import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppNoResultsComponent extends StatelessWidget with Component {
  /// ### AppDefaultComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[imagePath]__ Caminho da imagem a ser exibida
  ///
  /// __[title]__ Titulo a ser exibido
  ///
  final Behaviour behaviour;
  final String imagePath;
  final String title;

  const AppNoResultsComponent({
    Key? key,
    required this.behaviour,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Column(
      children: [
        const Spacer(flex: 1),
        Image.asset(
          imagePath,
          scale: 3.9.sp,
        ),
        Text(
          title,
          style: AppThemes.typography.zonaProBold_16,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
