import 'package:parking_lot/core/lang/pt.dart';
import 'package:parking_lot/core/lang/en.dart';
import 'package:parking_lot/core/lang/es.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale!;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'pt_BR': pt,
        'en_US': en,
        'es_ES': es,
      };
}
