import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppUtil {
  AppUtil._();

  static String getStatusSpot(String status) {
    switch (status) {
      case 'available':
        return 'available'.tr;
      case 'unavailable':
        return 'unavailable'.tr;
      case 'blocked':
        return 'blocked'.tr;
      default:
        return '';
    }
  }

  static Color getStatusColorSpot(String status) {
    switch (status) {
      case 'available':
        return AppThemes.colors.secondaryBlue;
      case 'unavailable':
        return AppThemes.colors.secondaryRed;
      case 'blocked':
        return AppThemes.colors.primaryColor;
      default:
        return AppThemes.colors.secondaryBlue;
    }
  }

  static String getStatusHistoric(String status) {
    switch (status) {
      case 'entry':
        return 'entry'.tr;
      case 'departure':
        return 'departure'.tr;
      default:
        return '';
    }
  }

  static Color getStatusColorHistoric(String status) {
    switch (status) {
      case 'entry':
        return AppThemes.colors.secondaryBlue;
      case 'departure':
        return AppThemes.colors.secondaryRed;
      default:
        return AppThemes.colors.secondaryBlue;
    }
  }

  static String getVehicleImageByType(String type) {
    switch (type) {
      case 'car':
        return AppThemes.images.car;
      case 'bicycle':
        return AppThemes.images.bicycle;
      case 'motobike':
        return AppThemes.images.motobike;
      case 'truck':
        return AppThemes.images.truck;
      default:
        return '';
    }
  }

  static Color getVehicleImageBackgroundColorByType(String type) {
    switch (type) {
      case 'car':
        return AppThemes.colors.secondaryRed;
      case 'bicycle':
        return AppThemes.colors.secondaryBlue;
      case 'motobike':
        return AppThemes.colors.secondaryPurple;
      case 'truck':
        return AppThemes.colors.secondaryOrange;
      default:
        return AppThemes.colors.secondaryBlack;
    }
  }

  static String getVehicleImageAboveByType(String type) {
    switch (type) {
      case 'car':
        return AppThemes.images.carAbove;
      case 'bicycle':
        return AppThemes.images.bicycleAbove;
      case 'motobike':
        return AppThemes.images.motobikeAbove;
      case 'truck':
        return AppThemes.images.truckAbove;
      default:
        return '';
    }
  }

  static Behaviour getBehaviourStatusSpot(String status) {
    switch (status) {
      case 'available':
        return Behaviour.empty;
      case 'unavailable':
        return Behaviour.regular;
      case 'blocked':
        return Behaviour.blocked;
      default:
        return Behaviour.empty;
    }
  }

  static String msToTime(int milliseconds) {
    var seconds = ((milliseconds / 1000) % 60).floor();
    var minutes = ((milliseconds / (1000 * 60)) % 60).floor();
    var hours = ((milliseconds / (1000 * 60 * 60)) % 24).floor();

    var hoursTime = (hours < 10) ? "0$hours" : hours;
    var minutesTime = (minutes < 10) ? "0$minutes" : minutes;
    var secondsTime = (seconds < 10) ? "0$seconds" : seconds;

    return '$hoursTime:$minutesTime:$secondsTime';
  }

  static String dateToAmPm(String date) {
    return DateFormat('hh:mm a').format(DateTime.parse(date));
  }

  static String toOnlyDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }
}
