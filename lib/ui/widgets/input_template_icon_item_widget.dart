import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/input_template_view/input_template_view_model.dart';
import 'package:stacked/stacked.dart';

class InputTemplateIconItemsWidget
    extends ViewModelWidget<InputTemplateViewModel> {
  final int index;
  final String selectedIcon;
  final String unselectedIcon;

  InputTemplateIconItemsWidget(
      {this.selectedIcon, this.unselectedIcon, this.index});

  Color getColor(int selectedIndex, bool isDark) {
    if (index == selectedIndex) {
      return isDark ? MyColors.primary : const Color(0xffFFC491);
    } else {
      return isDark ? const Color(0xff393C43) : const Color(0xffFFF1E4);
    }
  }

  String getIcon(int selectedIndex) {
    if (index == selectedIndex) {
      return selectedIcon;
    } else {
      return unselectedIcon;
    }
  }

  bool visibilityFlag(int selectedIndex) {
    if (index == selectedIndex) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context, InputTemplateViewModel viewModel) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Column(
      children: [
        InkWell(
            onTap: () => viewModel.onSelect(index),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getColor(viewModel.selectedIndex, isDark),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  getIcon(viewModel.selectedIndex),
                ),
              ),
            )),
      ],
    );
  }
}
