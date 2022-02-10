import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/utils/app_util.dart';
import 'package:parking_lot/layout/styles/medium/app_button_styles.dart';
import 'package:parking_lot/layout/styles/medium/app_text_input_styles.dart';
import 'package:parking_lot/layout/styles/medium/app_vehicle_type_card_styles.dart';
import 'package:parking_lot/layout/themes/app_themes.dart';

class AppModalBottomSheetComponent {
  static standard({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    ShapeBorder? shape,
    double? maxHeight,
    bool? hasPadding = true,
  }) {
    return showModalBottomSheet(
      context: Get.key.currentContext!,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(Get.key.currentContext!).viewInsets.bottom),
          width: MediaQuery.of(Get.key.currentContext!).size.width,
          constraints: BoxConstraints(maxHeight: maxHeight ?? double.infinity),
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.fromLTRB(13.w, 0.h, 13.w, 13.h),
            child: Container(
              width: MediaQuery.of(Get.key.currentContext!).size.width - 30.w,
              padding: hasPadding! ? EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h) : EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
                gradient: LinearGradient(
                  stops: const [0.04, 0.04],
                  colors: [AppThemes.colors.white, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                color: Colors.white,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }

  static parkingSpotAdd({
    required Key codeSpotKey,
    required TextEditingController codeSpotController,
    FocusNode? codeSpotFocusNode,
    String? Function(String?)? codeSpotValidate,
    required Function() onTapSave,
  }) {
    return standard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15.h),
          Text(
            'add_parking_spot'.tr,
            style: AppThemes.typography.zonaProSemiBold_18,
          ),
          SizedBox(height: 19.h),
          AppTextInputStyles.standard(
            behaviour: Behaviour.regular,
            fieldKey: codeSpotKey,
            controller: codeSpotController,
            focusNode: codeSpotFocusNode,
            validator: codeSpotValidate,
            isUpperCase: true,
            maxLength: 7,
            label: 'code'.tr,
            labelColor: codeSpotFocusNode != null ? AppThemes.colors.secondaryBlack : Colors.black38,
          ),
          SizedBox(height: 8.h),
          AppButtonStyles.standard(
            behaviour: Behaviour.regular,
            child: Text(
              'save'.tr,
              style: AppThemes.typography.zonaProBold_15,
            ),
            onTap: onTapSave,
          ),
        ],
      ),
    );
  }

  static vehicleAdd({
    required Key vehicleUidKey,
    required TextEditingController vehicleUidController,
    FocusNode? vehicleUidFocusNode,
    String? Function(String?)? vehicleUidValidate,
    required Key nmOwnerKey,
    required TextEditingController nmOwnerController,
    FocusNode? nmOwnerFocusNode,
    String? Function(String?)? nmOwnerValidate,
    required List<Map<String, dynamic>> vehicleTypes,
    required Function() onTapSave,
    required Function(int, CarouselPageChangedReason) onCarrouselPageChange,
  }) {
    return standard(
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15.h),
              Text(
                'add_vehicle'.tr,
                style: AppThemes.typography.zonaProSemiBold_18,
              ),
              SizedBox(height: 19.h),
              AppTextInputStyles.standard(
                behaviour: Behaviour.regular,
                fieldKey: vehicleUidKey,
                controller: vehicleUidController,
                focusNode: vehicleUidFocusNode,
                validator: vehicleUidValidate,
                isUpperCase: true,
                maxLength: 8,
                label: 'license_plate'.tr,
                labelColor: vehicleUidFocusNode != null ? AppThemes.colors.secondaryBlack : Colors.black38,
              ),
              SizedBox(height: 15.h),
              AppTextInputStyles.standard(
                behaviour: Behaviour.regular,
                fieldKey: nmOwnerKey,
                controller: nmOwnerController,
                focusNode: nmOwnerFocusNode,
                validator: nmOwnerValidate,
                maxLength: 20,
                label: 'owner'.tr,
                labelColor: nmOwnerFocusNode != null ? AppThemes.colors.secondaryBlack : Colors.black38,
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    height: 288,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.5,
                    initialPage: 1,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    onPageChanged: onCarrouselPageChange,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: vehicleTypes.length,
                  itemBuilder: (BuildContext carouselContext, int index, _) {
                    var vehicle = vehicleTypes[index];
                    return AppVehicleTypeCardStyles.standard(
                      behaviour: Behaviour.regular,
                      isSelected: vehicle['isSelected'],
                      imagePath: vehicle['image'],
                      label: vehicle['name'],
                      backgroundColor: AppUtil.getVehicleImageBackgroundColorByType(vehicle['type']),
                    );
                  },
                ),
              ),
              SizedBox(height: 8.h),
              AppButtonStyles.standard(
                behaviour: Behaviour.regular,
                child: Text(
                  'save'.tr,
                  style: AppThemes.typography.zonaProBold_15,
                ),
                onTap: onTapSave,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
