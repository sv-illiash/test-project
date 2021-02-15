import 'package:flutter/material.dart';

class OrLineWidget extends StatelessWidget {
  const OrLineWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 7),
            height: 0.7,
            color: Theme.of(context).buttonColor.withOpacity(0.1),
          ),
        ),
        Text(
          "OR",
          style: TextStyle(
              color: Theme.of(context).buttonColor.withOpacity(0.6),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.35),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 7),
            height: 0.7,
            color: Theme.of(context).buttonColor.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
