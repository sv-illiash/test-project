import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/package_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';

class PackageWidget extends StatelessWidget {
  final int index;
  final int currentIndex;
  final PackageObject packageObject;

  final Function(int index) onSelected;

  const PackageWidget({
    Key key,
    this.index = 0,
    this.currentIndex = 0,
    this.onSelected,
    this.packageObject,
  }) : super(key: key);

  isSelected() {
    return index == currentIndex;
  }

  Color getBorderColor(bool isDark) {
    if (isSelected()) {
      return MyColors.primary;
    } else {
      return isDark ? Color(0xFF33363C) : Color(0xFFFFF1E4);
    }
  }

  Color getOuterBorderColor(bool isDark) {
    if (isSelected()) {
      return MyColors.primary;
    } else {
      return Colors.transparent;
    }
  }

  Color getNameColor(bool isDark) {
    if (isSelected()) {
      return MyColors.primary;
    } else {
      return isDark ? Color(0xFF33363C) : Color(0xFFFFF1E4);
    }
  }

  Color getSubtextColor(bool isDark) {
    if (isSelected()) {
      return isDark ? Colors.white : MyColors.black;
    } else {
      return isDark
          ? Colors.white.withOpacity(0.4)
          : MyColors.black.withOpacity(0.7);
    }
  }

  Color getTextNameColor(bool isDark, BuildContext context) {
    if (isSelected()) {
      return MyColors.black;
    } else {
      return Theme.of(context).buttonColor;
    }
  }

  Color getBodyColor(bool isDark) {
    if (isSelected()) {
      return isDark ? Colors.white.withOpacity(0.05) : MyColors.primary;
    } else {
      return isDark ? MyColors.black : Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: getOuterBorderColor(isDark)),
            borderRadius: BorderRadius.circular(8)),
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.zero,
          onPressed: () => onSelected(index),
          color: getBodyColor(isDark),
          child: Container(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: getBorderColor(isDark)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 22,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: getNameColor(isDark),
                          ),
                          child: Text(
                            packageObject.title.toUpperCase(),
                            style: TextStyle(
                                color: getTextNameColor(isDark, context),
                                fontWeight: FontWeight.w600,
                                fontSize: 11),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(packageObject.time.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).buttonColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 34,
                                      height: 1.095)),
                              SizedBox(
                                height: 1.87,
                              ),
                              Text("min/day",
                                  style: TextStyle(
                                      color: getSubtextColor(isDark),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.17)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
