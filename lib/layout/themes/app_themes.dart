import 'package:parking_lot/layout/themes/colors/app_colors.dart';
import 'package:parking_lot/layout/themes/icons/app_icons.dart';
import 'package:parking_lot/layout/themes/images/app_images.dart';
import 'package:parking_lot/layout/themes/shimmer/app_shimmer.dart';
import 'package:parking_lot/layout/themes/spacing/app_spacing.dart';
import 'package:parking_lot/layout/themes/typography/app_typography.dart';

class AppThemes {
  AppThemes._();

  /// Cores padrões
  static AppColors get colors => AppColors();

  /// Tipografia padrão
  static AppTypography get typography => AppTypography();

  /// Espaçamentos padrões
  static AppSpacing get spacing => AppSpacing();

  // Shimmers padrões
  static AppShimmer get shimmer => AppShimmer();

  /// Icones padrões
  static AppIcons get icons => AppIcons();

  /// Imagens padrões
  static AppImages get images => AppImages();
}
