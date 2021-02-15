import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';

class RemoveButton extends StatelessWidget {
  final Color buttonColor;
  final Color iconColor;
  final EdgeInsets margin;
  final Color shadowColor;
  final VoidCallback onPressed;

  final double size;

  const RemoveButton({
    Key key,
    this.buttonColor = MyColors.primary,
    this.iconColor = MyColors.black,
    this.margin,
    this.shadowColor,
    this.onPressed,
    this.size = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: margin ?? EdgeInsets.only(top: 2),
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: shadowColor ?? Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4)
        ]),
        child: FlatButton(
          onPressed: onPressed ?? () {},
          color: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(5.5),
          child: Image.asset(
            "assets/close_icon.png",
            color: iconColor,
            height: size,
            width: size,
          ),
        ),
      ),
    );
  }
}
