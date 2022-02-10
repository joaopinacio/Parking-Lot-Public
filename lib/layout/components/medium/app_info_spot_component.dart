import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/app_layout_imports.dart';

class AppInfoSpotComponent extends StatelessWidget with Component {
  /// ### AppInfoSpotComponent
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
  final Behaviour behaviour;
  final String title;
  final String subtitle;
  final Color? titleColor;
  final Color? subtitleColor;

  const AppInfoSpotComponent({
    Key? key,
    required this.behaviour,
    required this.title,
    required this.subtitle,
    this.titleColor,
    this.subtitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppThemes.typography.zonaProSemiBold_11.copyWith(
            color: titleColor?.withOpacity(0.7) ?? AppThemes.colors.grayScale_1.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          subtitle,
          style: AppThemes.typography.zonaProBold_18.copyWith(
            color: subtitleColor ?? AppThemes.colors.secondaryBlack,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  @override
  Widget whenEmpty(BuildContext context, Behaviour childBehaviour) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppThemes.typography.zonaProSemiBold_11.copyWith(
            color: titleColor?.withOpacity(0.7) ?? AppThemes.colors.grayScale_1.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          '--',
          style: AppThemes.typography.zonaProBold_18.copyWith(
            color: AppThemes.colors.secondaryBlack,
          ),
        ),
      ],
    );
  }
}
