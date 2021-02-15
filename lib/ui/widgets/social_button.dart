import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double iconHeight;
  final String image;
  final double iconWidth;

  const SocialButton({
    Key key,
    this.onPressed,
    this.iconHeight = 20,
    this.iconWidth = 20,
    this.image = "assets/facebook-logo.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Theme.of(context).secondaryHeaderColor,
        padding: EdgeInsets.zero,
        onPressed: onPressed ?? () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            child: Image.asset(
              image,
              color: Theme.of(context).buttonColor,
              width: iconWidth,
              height: iconHeight,
            )));
  }
}
