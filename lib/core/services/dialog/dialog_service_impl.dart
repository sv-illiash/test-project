import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:my_book_reloaded/core/services/dialog/dialog_service.dart';

@LazySingleton(as: DialogService)
class DialogServiceImpl extends DialogService {
  @override
  void openDialog(Widget widget) {
    Get.dialog(widget);
  }
}
