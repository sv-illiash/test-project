import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/widgets/remove_button.dart';

class HabitItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final bool isEdited;
  final ChapterObject chapterObject;

  const HabitItem({
    Key key,
    this.isSelected = false,
    this.onPressed,
    this.isEdited = false,
    this.chapterObject,
  }) : super(key: key);

  Border buildBorder(bool isDark) {
    if (isSelected) {
      return isDark
          ? Border.all(color: MyColors.primary, width: 1)
          : Border.all(color: Colors.black, width: 1);
    } else {
      return isDark
          ? Border.all(color: Colors.transparent, width: 1)
          : Border.all(color: MyColors.textFieldBorder, width: 1);
    }
  }

  Color buildColor(bool isDark) {
    if (isSelected) {
      return isDark ? Colors.white.withOpacity(0.2) : MyColors.primary;
    } else {
      return isDark ? Colors.white.withOpacity(0.2) : Color(0xFFFFF1E4);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return FlatButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      child: Container(
        height: 82,
        padding: EdgeInsets.only(right: 22, left: 12),
        decoration: BoxDecoration(
            border: buildBorder(isDark),
            borderRadius: BorderRadius.circular(10),
            color: isDark ? Color(0xFF2C3036) : null),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: isDark
                          ? [
                              BoxShadow(
                                  color: Color.fromRGBO(3, 6, 30, 0.18),
                                  offset: Offset(0, 2),
                                  blurRadius: 14)
                            ]
                          : null,
                      color: buildColor(isDark)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chapterObject.time ?? "1",
                        style: TextStyle(
                            color: Theme.of(context).buttonColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      Text("min",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .buttonColor
                                  .withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(chapterObject.chapter ?? "Chapter",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .buttonColor
                                  .withOpacity(0.5),
                              fontSize: 11,
                              fontWeight: FontWeight.w400)),
                      Text(
                          chapterObject.title ??
                              "Identifying Your Excuses (Healthy Habits/destructive habits",
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 14,
                              height: 1.57,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                )
              ],
            ),
            Visibility(
              visible: isEdited,
              child: RemoveButton(
                buttonColor: Color(0xFF40434A),
                iconColor: Colors.white,
                margin: EdgeInsets.only(top: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
