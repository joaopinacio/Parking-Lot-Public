import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/model/parking_spot/parking_spot.dart';
import 'package:parking_lot/core/utils/app_util.dart';
import 'package:parking_lot/layout/app_layout_imports.dart';
import 'package:parking_lot/layout/styles/medium/app_medium_styles.dart';

import 'home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Scaffold(
          backgroundColor: AppThemes.colors.secondaryBlack,
          appBar: AppBarStyles.titleWithButton(
            title: 'parking_place'.tr,
            onTap: controller.toHistoricPage,
          ),
          floatingActionButton: controller.getIsSpotSelected
              ? controller.getSpotSelected.vehicle.value != null
                  ? AppButtonStyles.standard(
                      behaviour: Behaviour.regular,
                      width: 325,
                      height: 45,
                      child: Text('unbook_spot'.tr, style: AppThemes.typography.zonaProBold_15),
                      backgroundColor: AppThemes.colors.secondaryRed,
                      onTap: controller.removeVehicleFromSpot,
                    )
                  : AppButtonStyles.bookAndBlockOrUnblock(
                      onTap: controller.openVehicleAddModal,
                      onTapSecondButton: controller.blockOrUnblockSpot,
                      blocked: controller.getSpotSelected.status == 'blocked',
                    )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1400),
                curve: Curves.elasticOut,
                padding: EdgeInsets.fromLTRB(18.w, 20.h, 18.w, 25.h),
                height: controller.getSpotSelectedWithVehicle ? 130.h : 88.h,
                decoration: BoxDecoration(
                  color: AppThemes.colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppInfoSpotStyles.standard(
                            behaviour: controller.getSelectedSpotBehaviour,
                            title: 'parking_spot'.tr,
                            subtitle: controller.getSpotSelected.code,
                          ),
                          AppInfoSpotStyles.standard(
                            behaviour: controller.getSelectedSpotBehaviour,
                            title: 'time'.tr,
                            subtitle: controller.getSpotSelected.time!,
                          ),
                          AppInfoSpotStyles.standard(
                            behaviour: controller.getSelectedSpotBehaviour,
                            title: 'Status',
                            subtitle: AppUtil.getStatusSpot(controller.getSpotSelected.status),
                            subtitleColor: AppUtil.getStatusColorSpot(controller.getSpotSelected.status),
                          ),
                        ],
                      ),
                      if (controller.getSpotSelectedWithVehicle)
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppInfoSpotStyles.standard(
                                behaviour: controller.getSelectedSpotBehaviour,
                                title: 'vehicle_code'.tr,
                                subtitle: controller.getSpotSelected.vehicle.value!.uid,
                              ),
                              AppInfoSpotStyles.standard(
                                behaviour: controller.getSelectedSpotBehaviour,
                                title: 'owner'.tr,
                                subtitle: controller.getSpotSelected.vehicle.value!.nmOwner,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 27.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 1.7,
                      crossAxisSpacing: 60,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: controller.parkingSpotListMap.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      var parkingSpotMap = controller.parkingSpotListMap[index];
                      if (controller.parkingSpotListMap[index]['parkingSpot'] != null) {
                        ParkingSpot parkingSpot = controller.parkingSpotListMap[index]['parkingSpot'];
                        var vehicleType = controller.getVehicleType(parkingSpot);

                        return AppParkingSpotCardStyles.standard(
                          behaviour: AppUtil.getBehaviourStatusSpot(parkingSpot.status),
                          label: parkingSpot.code,
                          imagePath: AppUtil.getVehicleImageAboveByType(vehicleType),
                          isSelected: parkingSpotMap['isSelected'],
                          isLeft: index % 2 == 0 ? true : false,
                          onTap: () => controller.selectSpot(index),
                        );
                      } else {
                        return AppParkingSpotCardStyles.standard(
                          behaviour: Behaviour.empty,
                          label: '',
                          imagePath: '',
                          isSelected: false,
                          isLeft: index % 2 == 0 ? true : false,
                          onTap: controller.openParkingSpotAddModal,
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 75.h),
            ],
          ),
        ),
      ),
    );
  }
}
