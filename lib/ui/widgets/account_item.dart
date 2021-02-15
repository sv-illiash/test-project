import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  final bool value;
  final bool _isSwitcher;
  final Function(bool) onChanged;
  final Color color;
  final bool isBorder;
  final String suffixIconName;

  const AccountItem({
    Key key,
    this.icon,
    @required this.title,
    this.onPressed,
    this.color,
    this.isBorder = true,
    this.suffixIconName = "chevron-right.png",
  })  : this._isSwitcher = false,
        this.value = null,
        onChanged = null,
        super(key: key);

  const AccountItem.switcher({
    Key key,
    this.icon,
    @required this.title,
    this.value = false,
    @required this.onChanged,
    this.color,
    this.isBorder = true,
    this.suffixIconName = "chevron-right.png",
  })  : this._isSwitcher = true,
        this.onPressed = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    "assets/icons/$icon",
                    height: 20,
                    width: 20,
                    color: color ?? Theme.of(context).buttonColor,
                  ),
                ),
          Expanded(
            child: Container(
              padding: _isSwitcher
                  ? EdgeInsets.only(bottom: 5, top: 5, right: 20)
                  : EdgeInsets.only(bottom: 15, top: 13, right: 20),
              decoration: BoxDecoration(
                  border: isBorder
                      ? Border(
                          bottom: BorderSide(
                              color: Theme.of(context)
                                  .buttonColor
                                  .withOpacity(0.1)))
                      : null),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    title,
                    style: TextStyle(
                        color: color ?? Theme.of(context).buttonColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.35),
                  )),
                  _isSwitcher
                      ? CupertinoSwitch(
                          activeColor: Theme.of(context).toggleableActiveColor,
                          value: value,
                          onChanged: onChanged)
                      : suffixIconName == null
                          ? Container()
                          : Image.asset(
                              "assets/$suffixIconName",
                              height: 20,
                              width: 20,
                              color: color ?? Theme.of(context).buttonColor,
                            )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
