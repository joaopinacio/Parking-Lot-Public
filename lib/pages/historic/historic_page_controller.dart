import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/model/days_of_month/days_of_month_model.dart';
import 'package:parking_lot/core/model/historic/historic.dart';
import 'package:parking_lot/core/repositories/historic_repository/historic_repository_interface.dart';

class HistoricPageController extends GetxController {
  final IHistoricRepository _historicRepository;

  HistoricPageController({
    required IHistoricRepository historicRepository,
  }) : _historicRepository = historicRepository;

  late StreamSubscription _historicStream;

  TextEditingController textSearchController = TextEditingController();

  var historicList = <Historic>[].obs;
  var behaviourList = Behaviour.loading.obs;

  var isSearchOpen = false.obs;
  var searchText = ''.obs;
  var daysOfMonth = 0;
  var listDaysOfMonth = <DaysOfMonthModel>[].obs;
  var selectedDate = DateTime.now();
  var daysOfMonthIndexSelected = 0;
  var entries = '';
  var departures = '';

  ScrollController scrollDateController = ScrollController();

  bool get getIsSearchOpen => isSearchOpen.value;
  String get getSearchText => searchText.value;

  @override
  void onInit() {
    super.onInit();
    initializeDateFormatting(Get.locale!.toString());
    textSearchController.addListener(_listenTextSearchController);

    buildListDaysInMonth();
    fetchHistorics();
  }

  List<Historic> get getFilteredHistoricList {
    var result = historicList.where((historic) {
      var result = true;
      var vehicle = historic.vehicle.value;
      var parkingSpot = historic.parkingSpot.value;

      /*
        final fromDate = DateTime.now(); // Variavel de Data
        final fromOnlyDate = DateTime(fromDate.year, fromDate.month, fromDate.day);

        var historicDate = DateTime.parse(historic.dtInsert);
        var historicDateOnlyDate = DateTime(historicDate.year, historicDate.month, historicDate.day);

        var isFromDate = historicDateOnlyDate == fromOnlyDate;
      */

      var isFromDate = true;

      if (vehicle != null && parkingSpot != null) {
        result = (vehicle.nmOwner.toLowerCase().contains(getSearchText.toLowerCase()) ||
            vehicle.uid.toLowerCase().contains(getSearchText.toLowerCase()) ||
            parkingSpot.code.toLowerCase().contains(getSearchText.toLowerCase()));
      }
      return result && isFromDate;
    }).toList();

    var countEntries = 0;
    var countDepartures = 0;
    for (var historic in result) {
      if (historic.status == 'entry') {
        countEntries++;
      } else {
        countDepartures++;
      }
    }
    entries = countEntries.toString();
    departures = countDepartures.toString();

    return result;
  }

  void buildListDaysInMonth() async {
    var indexSelected = 0;
    daysOfMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;

    listDaysOfMonth.clear();
    for (var day = 1; day <= daysOfMonth; day++) {
      var dateDay = DateTime(selectedDate.year, selectedDate.month, day);
      var abrevDay = DateFormat('EEE', Get.locale!.toString()).format(dateDay).capitalizeFirst!;
      var abrevMonth = DateFormat('MMM', Get.locale!.toString()).format(dateDay).capitalizeFirst!;
      var isSelected = selectedDate.day == day;

      var daysOfMonth = DaysOfMonthModel(
        day: day.toString(),
        abrevDay: abrevDay,
        month: selectedDate.month.toString(),
        abrevMonth: abrevMonth,
        year: selectedDate.year.toString(),
        date: DateTime(selectedDate.year, selectedDate.month, day),
        isSelected: isSelected,
      );

      listDaysOfMonth.add(daysOfMonth);

      if (isSelected) indexSelected = (listDaysOfMonth.length - 1);
    }
    listDaysOfMonth.refresh();
    daysOfMonthIndexSelected = indexSelected;
    await Future.delayed(const Duration(milliseconds: 400));
    _animateToIndex(indexSelected);
  }

  void fetchHistorics() {
    _historicStream = _historicRepository.getTodayHistorics()!.listen(_listenHistoricStream);
  }

  void fetchHistoricsByDate() {
    _historicStream.cancel();
    var date = listDaysOfMonth[daysOfMonthIndexSelected].date;

    _historicStream = _historicRepository.getHistoricsByDate(date: date)!.listen(_listenHistoricStream);
  }

  void _listenHistoricStream(List<Historic> list) async {
    historicList.value = list;

    list.sort((a, b) => b.dtInsert.compareTo(a.dtInsert));

    for (var historic in historicList) {
      await historic.parkingLot.load();
      await historic.vehicle.load();
      await historic.parkingSpot.load();
      historicList.refresh();
    }

    behaviourList.value = Behaviour.regular;

    if (kDebugMode) print('Historic Length:');
    if (kDebugMode) print(list.length);
  }

  void _listenTextSearchController() {
    searchText.value = textSearchController.text;
  }

  void onTapSearch(bool status) async {
    if (!status) await Future.delayed(const Duration(milliseconds: 200));
    isSearchOpen.value = status;
  }

  void onTapSelectDate(int index) {
    if (daysOfMonthIndexSelected != index) {
      selectedDate = DateTime(selectedDate.year, selectedDate.month, int.parse(listDaysOfMonth[index].day));
      listDaysOfMonth[daysOfMonthIndexSelected].isSelected = false;
      listDaysOfMonth[index].isSelected = true;
      daysOfMonthIndexSelected = index;
      fetchHistoricsByDate();
      listDaysOfMonth.refresh();
      _animateToIndex(index);
    }
  }

  void _animateToIndex(int index) {
    scrollDateController.animateTo(
      index * 46.w,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  String getActualMonthName() {
    var monthName = DateFormat('MMMM', Get.locale!.toString()).format(selectedDate).capitalizeFirst!;
    return monthName;
  }

  void selectMonth() async {
    var now = DateTime.now();

    await showMonthPicker(
      context: Get.context!,
      firstDate: now.subtract(const Duration(days: 7300)),
      lastDate: now.add(const Duration(days: 7300)),
      initialDate: selectedDate,
    ).then((date) {
      if (date != null) {
        if (date.month == now.month) {
          selectedDate = now;
        } else {
          selectedDate = date;
        }
        buildListDaysInMonth();
        fetchHistoricsByDate();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    _historicStream.cancel();
  }
}
