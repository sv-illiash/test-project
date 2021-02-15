import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerWidget extends StatelessWidget {

  final double radius;

  const TimerWidget({
    Key key, this.radius = 145,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      circularStrokeCap: CircularStrokeCap.round,
      lineWidth: 7.0,
      backgroundColor: Theme.of(context).buttonColor.withOpacity(0.3),
      percent: 0.7,
      center: Column(
        children: [
          Text(
            "Timer",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).buttonColor.withOpacity(0.8),
              fontSize: radius * 0.085,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "1:00",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).buttonColor,
              fontSize: radius * 0.179,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      progressColor: MyColors.primary,
    );
  }
}
