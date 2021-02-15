import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/stats_view/stats_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/my_scaffold.dart';
import 'package:stacked/stacked.dart';

class StatsView extends StatefulWidget {
  @override
  _StatsViewState createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatsViewModel>.reactive(
        viewModelBuilder: () => StatsViewModel(),
        onModelReady: (model) => model.init(),
        builder: (buildContext, model, widget) {
          return MyScaffold(
              imageName: "selected_background.png",
              padding: EdgeInsets.zero,
              loading: model.isBusy,
              child: ListView.builder(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 60, bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: model.statsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return StatsItem(
                    statObject: model.statsList[index],
                  );
                },
              ));
        });
  }
}

class StatsItem extends ViewModelWidget<StatsViewModel> {
  final BookObject statObject;

  const StatsItem({Key key, @required this.statObject}) : super(key: key);

  @override
  Widget build(BuildContext context, StatsViewModel viewModel) {
    return FlatButton(
      onPressed: () => viewModel.openStatsDetailsView(statObject),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      splashColor: MyColors.primary.withOpacity(0.1),
      highlightColor: MyColors.primary.withOpacity(0.1),
      hoverColor: MyColors.primary.withOpacity(0.1),
      child: Container(
        height: 131,
        child: Row(
          children: [
            Image.asset(
              "assets/${statObject.image}",
              height: 149,
              width: 97,
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    statObject.title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        fontSize: 14),
                  ),
                  Visibility(
                    visible: statObject.author.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1.5),
                      child: Text(statObject.author,
                          maxLines: 2,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .buttonColor
                                  .withOpacity(0.7),
                              fontWeight: FontWeight.w600,
                              height: 1.75,
                              fontSize: 12)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        TimeWidget(
                          title: "time",
                          value: statObject.time,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TimeWidget(
                          title: "times",
                          value: statObject.times,
                          subValue: " / 60",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeWidget extends StatelessWidget {
  final String value;
  final String title;
  final String subValue;

  const TimeWidget({
    Key key,
    @required this.value,
    @required this.title,
    this.subValue = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return Container(
      height: 50,
      width: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isDark ? Color(0xFF30333B) : MyColors.primary,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: value,
                style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                      text: subValue,
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                ],
              )),
          Text(title,
              style: TextStyle(
                  height: 0.95,
                  color: Theme.of(context).buttonColor.withOpacity(0.7),
                  fontWeight: FontWeight.w600,
                  fontSize: 12)),
        ],
      ),
    );
  }
}
