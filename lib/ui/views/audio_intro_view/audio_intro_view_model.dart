import 'package:flutter/cupertino.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/services/bottom_sheet/bottom_sheet_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/widgets/help_bottom_sheet.dart';
import 'package:stacked/stacked.dart';

class AudioIntroViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  ScrollController scrollController = ScrollController();

  onBackPressed() {
    _navigationService.pop();
  }

  onOpenBaseTemplateView() {
    _navigationService.pushNamed(Routes.BaseTemplateView);
  }

  void openHelpBottomSheet() {
    _bottomSheetService.openBottomSheet(HelpBottomSheet());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
