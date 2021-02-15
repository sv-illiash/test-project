import 'package:flutter/material.dart';

class MySliverWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget widget;

  MySliverWidget(
    this.widget, {
    this.expandedHeight = 180,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
