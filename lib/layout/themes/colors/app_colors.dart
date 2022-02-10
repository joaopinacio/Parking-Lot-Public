import 'package:flutter/painting.dart';

class AppColors {
  Color get black => const Color(0xFF000000);
  Color get white => const Color(0xFFF6FBFF);

  Color get primaryColor => const Color(0xFFF8D73A);
  Color get secondaryGray => const Color(0xFF5D6974);
  Color get secondaryBlack => const Color(0xFF252626);
  Color get secondaryBlue => const Color(0xFF6099FC);
  Color get secondaryGreen => const Color(0xFF6EFC60);
  Color get secondaryRed => const Color(0xFFFC6060);
  Color get secondaryPurple => const Color(0xFF6560FC);
  Color get secondaryOrange => const Color(0xFFFC9C60);

  Color get grayScale_1 => const Color(0xFF78848E);
  Color get grayScale_2 => const Color(0xFF989CA0);
  Color get grayScale_3 => const Color(0xFF3f4448);

  Color get opaqueGrayScale_2 => const Color(0xFF989CA0).withOpacity(0.6);
  Color get opaqueGrayScale_2_15 => const Color(0xFF989CA0).withOpacity(0.15);

  List<Map<String, Color>> get namedColors => [
        {'black': black},
        {'white': white},
        {'primaryColor': primaryColor},
        {'secondaryGray': secondaryGray},
        {'grayScale_1': grayScale_1},
      ];
}
