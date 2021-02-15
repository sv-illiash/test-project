import 'package:flutter/cupertino.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/core/services/bottom_sheet/bottom_sheet_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/widgets/help_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

class BaseTemplateViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  PageController pageController = PageController();

  int count = 5;
  double progress = 0;

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

  void openHelpBottomSheet() {
    _bottomSheetService.openBottomSheet(HelpBottomSheet());
  }
}
