import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/utils/app_util.dart';
import 'package:parking_lot/layout/app_layout_imports.dart';
import 'package:parking_lot/layout/styles/large/app_historic_header_calendar_styles.dart';
import 'package:parking_lot/layout/styles/medium/app_medium_styles.dart';
import 'package:parking_lot/layout/styles/small/app_no_results_styles.dart';

import 'historic_page_controller.dart';

class HistoricPage extends GetView<HistoricPageController> {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Obx(
        () => Scaffold(
          backgroundColor: AppThemes.colors.white,
          appBar: AppBarStyles.titleWithBack(
            title: 'historic'.tr,
            onTapBack: Get.back,
            textController: controller.textSearchController,
            isSearchOpen: controller.getIsSearchOpen,
            onTapSearch: controller.onTapSearch,
          ),
          body: Column(
            children: [
              SizedBox(height: 10.h),
              AppHistoricHeaderCalendarStyles.standard(
                behaviour: Behaviour.regular,
                monthName: controller.getActualMonthName(),
                day: controller.selectedDate.day.toString(),
                totalQty: controller.getFilteredHistoricList.length.toString(),
                entryQty: controller.entries,
                departureQty: controller.departures,
                onTap: controller.selectMonth,
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 50.h,
                child: ListView.builder(
                  controller: controller.scrollDateController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listDaysOfMonth.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    var daysInMonth = controller.listDaysOfMonth[index];

                    return AppDayCardStyles.standard(
                      behaviour: Behaviour.regular,
                      day: daysInMonth.day,
                      abrevDay: daysInMonth.abrevDay,
                      isSelected: daysInMonth.isSelected,
                      onTap: () => controller.onTapSelectDate(index),
                      isFirst: index == 0,
                      isLast: (controller.listDaysOfMonth.length - 1) == index,
                    );
                  },
                ),
              ),
              Expanded(
                child: controller.getFilteredHistoricList.isEmpty
                    ? AppNoResultsStyles.main(behaviour: Behaviour.regular)
                    : Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.getFilteredHistoricList.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            var historic = controller.getFilteredHistoricList[index];
                            var vehicle = historic.vehicle.value;
                            var parkingSpot = historic.parkingSpot.value;

                            if (vehicle != null && parkingSpot != null) {
                              return AppHistoricCardStyles.standard(
                                behaviour: Behaviour.regular,
                                imagePath: AppUtil.getVehicleImageByType(vehicle.type),
                                imageBackgroundColor: AppUtil.getVehicleImageBackgroundColorByType(vehicle.type),
                                title: vehicle.nmOwner,
                                subtitle: vehicle.uid,
                                threelineTitle: parkingSpot.code,
                                status: AppUtil.getStatusHistoric(historic.status),
                                statusColor: AppUtil.getStatusColorHistoric(historic.status),
                                time: historic.busyTime,
                                hours: AppUtil.dateToAmPm(historic.dtInsert),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
