import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback onBackPressed;
  final String title;
  final Color backgroundColor;
  final bool border;
  final EdgeInsets padding;

  final VoidCallback onRightButtonPressed;
  final String rightButtonIcon;

  const MyAppBar({
    Key key,
    this.onBackPressed,
    @required this.title,
    this.backgroundColor,
    this.border = true,
    this.padding,
    this.onRightButtonPressed,
    this.rightButtonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 22, bottom: 10.5),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: border
              ? Border(
                  bottom: BorderSide(
                      color: Theme.of(context).buttonColor.withOpacity(0.1)))
              : null),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: onRightButtonPressed != null ? CupertinoButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              minSize: 24,
              child: Image.asset(
                rightButtonIcon,
                color: Theme.of(context).buttonColor,
                height: 24,
                width: 24,
              ),
              onPressed: onRightButtonPressed,
            ) : Container(),
          ),
          Visibility(
            visible: onBackPressed != null,
            child: Align(
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 10),
                minSize: 24,
                child: Image.asset(
                  "assets/chevron-left.png",
                  color: Theme.of(context).buttonColor,
                  height: 24,
                  width: 24,
                ),
                onPressed: onBackPressed,
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.17),
              ))
        ],
      ),
    );
  }
}
