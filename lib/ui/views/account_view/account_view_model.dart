import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/services/dialog/dialog_service.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/widgets/feedback_dialog/feedback_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class AccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  SharedPreferences prefs;
  bool isDark = false;

  AccountViewModel() {
    isDark = Get.theme.brightness == Brightness.dark;
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeMode.toString().split('.')[1]);
  }

  openInputTemplateView() {
    _navigationService.pushNamed(Routes.InputTemplateView);

  }

  openSubscriptionView(String data) {
    _navigationService.pushNamed(Routes.SubscriptionView,
        arguments: LegalViewArguments(data: data));
    //_navigationService.pushNamed(Routes.SubscriptionView);
  }
  openFeedbackDialog() {
    _dialogService.openDialog(FeedbackDialog());
  }

  openLegalView(String data) {
    _navigationService.pushNamed(Routes.LegalView,
        arguments: LegalViewArguments(data: data));
  }

  openAccountInfo() {
    _navigationService.pushNamed(Routes.AccountInfoView);
  }

  openSupport() {
    _navigationService.pushNamed(Routes.SupportView);
  }

  openNotifications() {
    _navigationService.pushNamed(Routes.NotificationsView);
  }

  void onThemeChange(bool value) {
    isDark = value;
    ThemeMode themeMode;
    if (isDark) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    Get.changeThemeMode(themeMode);
    setTheme(themeMode);
    notifyListeners();
  }
}
