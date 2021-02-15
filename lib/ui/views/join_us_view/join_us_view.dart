import 'package:cupertino_stackview/cupertino_stackview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/join_us_view/join_us_view_body.dart';
import 'package:my_book_reloaded/ui/views/join_us_view/join_us_view_model.dart';
import 'package:stacked/stacked.dart';

class JoinUsView extends StatefulWidget {
  @override
  _JoinUsViewState createState() => _JoinUsViewState();
}

class _JoinUsViewState extends State<JoinUsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JoinUsViewModel>.reactive(
        viewModelBuilder: () => JoinUsViewModel(),
        onModelReady: (model) => model.init(context),
        builder: (buildContext, model, widget) {
          return CupertinoStackView(
            true,
            "JoinUs",
            JoinUsViewBody(),
            Colors.black,
            isDismissible: false,
            radius: Radius.circular(16),
          );
        });
  }
}
