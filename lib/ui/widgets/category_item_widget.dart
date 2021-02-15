import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/category_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/explore_view/explore_view_model.dart';
import 'package:stacked/stacked.dart';

class CategoryItem extends ViewModelWidget<ExploreViewModel> {
  final int index;
  final CategoryObject categoryObject;
  final EdgeInsets margin;

  const CategoryItem({Key key, this.index, this.categoryObject, this.margin})
      : super(key: key);

  Color getTextColor(bool isDark, int categoryIndex) {
    if (index == categoryIndex) {
      return isDark ? Colors.white : MyColors.black;
    } else {
      return isDark ? MyColors.primary : MyColors.black;
    }
  }

  Color getButtonColor(bool isDark, int categoryIndex) {
    if (index == categoryIndex) {
      return isDark ? Colors.white.withOpacity(0.1) : MyColors.primary;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context, ExploreViewModel viewModel) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Padding(
      padding: index == 0
          ? EdgeInsets.only(left: 20, right: 5)
          : EdgeInsets.symmetric(horizontal: 5),
      child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: getButtonColor(isDark, viewModel.categoryIndex),
          onPressed: () => viewModel.changeCategory(index),
          child: Text(
            categoryObject.title,
            style: TextStyle(
                color: getTextColor(isDark, viewModel.categoryIndex),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.28),
          )),
    );
  }
}
