import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:my_book_reloaded/core/models/onboarding_object.dart';
import 'package:my_book_reloaded/core/services/onboarding/onboarding_service.dart';

@LazySingleton(as: OnboardingService)
class OnboardingServiceImpl implements OnboardingService {
  @override
  List<OnboardingObject> getOnboarding() {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return [
      OnboardingObject(
          imagePath: (isDark ? "dark" : "light") + "/onboarding1.png",
          title: "Integrate book in your daily life",
          description:
              "Find the book you want to integrate to your daily life. Our tasks manager  inspires you to become a better person."),
      OnboardingObject(
          imagePath: (isDark ? "dark" : "light") + "/onboarding2.png",
          title: "Get thoughts from the book",
          description:
              "Pay attention to your thoughts you can get from the books. Your daily thoughts will build your daily action plan."),
      OnboardingObject(
          imagePath: (isDark ? "dark" : "light") + "/onboarding3.png",
          title: "Build your character",
          description:
              "Pay attention how well you follow habits because they become your character."),
    ];
  }
}
