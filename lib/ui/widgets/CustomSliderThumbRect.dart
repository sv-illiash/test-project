import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';

class CustomSliderThumbRect extends SliderComponentShape {
  final double thumbRadius;
  final thumbHeight;
  final int min;
  final int max;
  final Color color;

  const CustomSliderThumbRect(
      {this.thumbRadius, this.thumbHeight, this.min, this.max, this.color});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    double textScaleFactor,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    bool isDark = Get.theme.brightness == Brightness.dark;
    final paint = Paint()
      ..color = isDark ? MyColors.black : Colors.white
      ..style = PaintingStyle.fill;

    final paintStroke = Paint()
      ..color = sliderTheme.activeTrackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    TextSpan span = new TextSpan(
        style: new TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: color),
        text: '${getValue(value)}');

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter = Offset(center.dx - (tp.width / 2), center.dy + 22);

    canvas.drawCircle(center, thumbRadius, paint);
    canvas.drawCircle(center, thumbRadius, paintStroke);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
