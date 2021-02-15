import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/services/bottom_sheet/bottom_sheet_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/widgets/help_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

class InputTemplateViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  ScrollController scrollController = ScrollController();
  PageController pageController = PageController();
  int selectedIndex = 0;
  int count = 3;
  double progress = 0;
  bool isDark = false;

  InputTemplateViewModel() {
    isDark = Get.theme.brightness == Brightness.dark;
  }

  void init() {
    progress = 1 / count;
  }

  onBackPressed() {
    _navigationService.pop();
  }

  onNextPage() {
    pageController
        .nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut)
        .then((value) {
      progress = (pageController.page + 1) / count;
      notifyListeners();
    });
  }

  void onSelect(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void openHelpBottomSheet() {
    _bottomSheetService.openBottomSheet(HelpBottomSheet());
  }
}
