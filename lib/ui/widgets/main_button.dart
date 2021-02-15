import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool enable;
  final Color color;
  final Color textColor;

  const MainButton({
    Key key,
    this.onPressed,
    @required this.text,
    this.enable = true,
    this.color = MyColors.primary,
    this.textColor = MyColors.black,
  }) : super(key: key);

  BorderSide getBorderSide(bool isDark) {
    if (enable) {
      return BorderSide.none;
    } else {
      return BorderSide(
          color: isDark ? MyColors.primary : MyColors.black, width: 1.5);
    }
  }

  Color getTextColor(bool isDark) {
    if (enable) {
      return textColor;
    } else {
      return isDark ? MyColors.primary : textColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return FlatButton(
      color: enable ? color : Colors.transparent,
      shape: RoundedRectangleBorder(
          side: getBorderSide(isDark), borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: getTextColor(isDark),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
      padding: EdgeInsets.zero,
    );
  }
}
