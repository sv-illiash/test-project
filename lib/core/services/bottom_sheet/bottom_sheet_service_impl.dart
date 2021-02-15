import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:my_book_reloaded/core/services/bottom_sheet/bottom_sheet_service.dart';

@LazySingleton(as: BottomSheetService)
class BottomSheetServiceImpl extends BottomSheetService {
  @override
  void openBottomSheet(Widget widget) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    Get.bottomSheet(
      widget,
      useRootNavigator: true,
      backgroundColor: isDark ? Color(0xFF272B31) : Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      isScrollControlled: true,
    );
  }
}
