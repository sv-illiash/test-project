import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermAndCondWidget extends StatelessWidget {
  const TermAndCondWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("By registering you are accepting the",
            style: Get.textTheme.headline6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
                minSize: 20,
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Terms and Conditions",
                    style: Get.textTheme.headline4,
                  ),
                ),
                onPressed: () {}),
            Text(" and ", style: Get.textTheme.headline6),
            CupertinoButton(
                minSize: 20,
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Privacy Policy",
                    style: Get.textTheme.headline4,
                  ),
                ),
                onPressed: () {}),
          ],
        )
      ],
    );
  }
}
