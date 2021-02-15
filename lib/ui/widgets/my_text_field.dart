import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';

class MyTextField extends StatelessWidget {
  final EdgeInsets margin;
  final bool isButton;
  final VoidCallback onButtonPressed;
  final String buttonText;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final bool showSearch;
  final Color lightBackground;
  final bool border;
  final List<BoxShadow> boxShadow;

  final double height;
  final bool _multiline;
  final TextEditingController controller;

  const MyTextField({
    Key key,
    this.margin = EdgeInsets.zero,
    this.isButton = false,
    this.onButtonPressed,
    this.buttonText = "",
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.showSearch = false,
    this.boxShadow,
    this.lightBackground,
    this.border = true,
    this.height = 55,
    this.controller,
  })  : _multiline = false,
        super(key: key);

  const MyTextField.multiline({
    Key key,
    this.margin = EdgeInsets.zero,
    this.isButton = false,
    this.onButtonPressed,
    this.buttonText = "",
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.showSearch = false,
    this.boxShadow,
    this.lightBackground,
    this.border = true,
    this.height = 55,
    this.controller,
  })  : _multiline = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Container(
      margin: margin,
      constraints: BoxConstraints(maxHeight: height),
      alignment: _multiline ? Alignment.topCenter : null,
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          border: isDark
              ? null
              : border
                  ? Border.all(color: MyColors.textFieldBorder, width: 1)
                  : null,
          borderRadius: BorderRadius.circular(12),
          color: isDark ? Color(0xFF2C3036) : lightBackground),
      child: Row(
        children: [
          Visibility(
            visible: showSearch,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                "assets/search_icon.png",
                color: Theme.of(context).buttonColor.withOpacity(0.6),
                width: 20,
                height: 20,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType:
                  _multiline ? TextInputType.multiline : TextInputType.text,
              maxLines: _multiline ? null : 1,
              obscuringCharacter: "*",
              style: TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.35),
              decoration: InputDecoration(
                  alignLabelWithHint: false,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Theme.of(context).buttonColor.withOpacity(0.3),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.35),
                  labelStyle: TextStyle(
                      color: Theme.of(context).buttonColor.withOpacity(0.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.35),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  labelText: labelText),
            ),
          ),
          isButton
              ? CupertinoButton(
                  onPressed: onButtonPressed ?? () {},
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color: Theme.of(context).buttonColor.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.4),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
