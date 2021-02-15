import 'package:flutter/cupertino.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/models/reminder_object.dart';
import 'package:my_book_reloaded/core/services/bottom_sheet/bottom_sheet_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/views/reminder_view/reminder_view.dart';
import 'package:my_book_reloaded/ui/widgets/reminder_time_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

class ReminderViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  bool isAllDays = true;
  List<ReminderObject> days = [
    ReminderObject(selected: false, dayName: "Set same time in all days"),
    ReminderObject(selected: false, dayName: "Monday"),
    ReminderObject(selected: false, dayName: "Tuesday"),
    ReminderObject(selected: false, dayName: "Wednesday"),
    ReminderObject(selected: false, dayName: "Thursday"),
    ReminderObject(selected: false, dayName: "Friday"),
    ReminderObject(selected: false, dayName: "Saturday"),
    ReminderObject(selected: false, dayName: "Sunday"),
  ];

  void allDaysValueChange(bool value) {
    isAllDays = value;
    if (isAllDays) {
      days.forEach((element) {
        element.selected = false;
      });
    }
    notifyListeners();
  }

  void goToHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.MainView,
        predicate: (route) => false);
  }

  void openRemainderBottomSheet() {
    _bottomSheetService.openBottomSheet(ReminderTimeBottomSheet());
  }

  void selectDay(ReminderObject reminderObject, bool value) {
    if (isAllDays == true && value == true) {
      isAllDays = false;
    }
    reminderObject.selected = value;
    notifyListeners();
  }

  List<Widget> buildDaysList() {
    List<Widget> list = [];
    days.forEach((element) {
      list.add(ReminderWidget(
        reminderObject: element,
      ));
    });
    return list;
  }

  void onBackPressed() {
    _navigationService.pop();
  }
}
