import 'package:flutter/material.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart';
import 'package:my_book_reloaded/core/models/onboarding_object.dart';
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/core/services/onboarding/onboarding_service.dart';
import 'package:stacked/stacked.dart';

class OnboardingViewModel extends BaseViewModel {
  final _onboardingService = locator<OnboardingService>();
  final _navigationService = locator<NavigationService>();

  List<OnboardingObject> onboardingList = [];
  PageController _pageController;
  int pageIndex = 0;

  PageController get pageController => _pageController;

  void init() {
    _pageController = PageController();
    onboardingList = _onboardingService.getOnboarding();
  }

  void onPageChange(int index) {
    pageIndex = index;
  }

  void openJoinUs() {
    _navigationService.pushReplacementNamed(Routes.JoinUsView);
  }

  void nextPage() {
    if (pageIndex != onboardingList.length - 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      openJoinUs();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
