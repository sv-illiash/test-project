import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool resizeToAvoidBottomInset;
  final String imageName;
  final bool loading;

  const MyScaffold(
      {Key key,
      this.child,
      this.padding,
      this.resizeToAvoidBottomInset = true,
      this.imageName = "background.png",
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String theme = Get.theme.brightness == Brightness.dark ? "dark" : "light";
    return Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: Container(
            padding: padding ??
                EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
                    top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/$theme/$imageName"),
                    fit: BoxFit.cover)),
            child:
                loading ? Center(child: CircularProgressIndicator()) : child));
  }
}
