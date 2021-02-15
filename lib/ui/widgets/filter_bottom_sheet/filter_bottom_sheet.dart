import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:stacked/stacked.dart';

import 'filter_bottom_sheet_model.dart';

class FilterBottomSheet extends StatefulWidget {
  final Function onApplyCallback;

  const FilterBottomSheet({
    Key key,
    this.onApplyCallback,
  }) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterBottomSheetModel>.reactive(
        viewModelBuilder: () => FilterBottomSheetModel(),
        onModelReady: (model) => model.init(widget.onApplyCallback),
        builder: (buildContext, model, widget) {
          return Container(
            height: 351,
            child: Column(
              children: <Widget>[
                Container(
                  height: 4,
                  width: 45,
                  margin: EdgeInsets.only(bottom: 13.5, top: 9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: Theme.of(context).buttonColor),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "Filter by",
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontSize: 22,
                          height: 1.45,
                          fontWeight: FontWeight.w700),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoButton(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .buttonColor
                                    .withOpacity(0.7)),
                          ),
                          onPressed: model.onCancel),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(bottom: 8, top: 15.15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: Theme.of(context).buttonColor.withOpacity(0.1)),
                ),
                FilterItem(
                  index: 0,
                  title: "Filter by week",
                ),
                FilterItem(
                  index: 1,
                  title: "Filter by month",
                ),
                FilterItem(
                  index: 2,
                  title: "Filter by year",
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MainButton(text: "Apply", onPressed: model.onApply),
                ),
                SizedBox(
                  height: 43,
                ),
              ],
            ),
          );
        });
  }
}

class FilterItem extends ViewModelWidget<FilterBottomSheetModel> {
  final int index;
  final String title;

  const FilterItem({
    Key key,
    this.index = 0,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, FilterBottomSheetModel viewModel) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      onPressed: () => viewModel.onSelected(index),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            title,
            style: TextStyle(
                color: Theme.of(context).buttonColor,
                height: 1.6,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          )),
          index != viewModel.currentIndex
              ? Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle),
                )
              : Container(
                  width: 22,
                  height: 22,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MyColors.primary, shape: BoxShape.circle),
                  child: Image.asset("assets/check_icon.png"),
                )
        ],
      ),
    );
  }
}
