import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/chapter_view/chapter_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/CustomSliderThumbRect.dart';
import 'package:my_book_reloaded/ui/widgets/CustomTrackShape.dart';
import 'package:stacked/stacked.dart';

class ChapterSliderBody extends ViewModelWidget<ChapterViewModel> {
  @override
  Widget build(BuildContext context, ChapterViewModel viewModel) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 18, bottom: 15, top: 15, right: 18),
        itemBuilder: (BuildContext context, int index) {
          return ChapterSliderItem();
        },
      ),
    );
  }
}

class ChapterSliderItem extends StatefulWidget {
  const ChapterSliderItem({
    Key key,
  }) : super(key: key);

  @override
  _ChapterSliderItemState createState() => _ChapterSliderItemState();
}

class _ChapterSliderItemState extends State<ChapterSliderItem> {
  double value1 = 5;
  double value2 = 7;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 33,
        ),
        Text(
          "Monday",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).buttonColor,
              height: 1.17),
        ),
        SizedBox(
          height: 33,
        ),
        SliderItem(
          value: value1,
          title: "A. Break the habit of putting things off",
          onChange: (value) {
            setState(() {
              value1 = value;
            });
          },
        ),
        SizedBox(
          height: 25,
        ),
        SliderItem(
          value: value2,
          title:
              "B. Acquire the habit of complimenting people at every possible opportunity",
          onChange: (value) {
            setState(() {
              value2 = value;
            });
          },
        ),
      ],
    );
  }
}

class SliderItem extends StatelessWidget {
  final String title;
  final double value;
  final Function(double value) onChange;

  const SliderItem({
    Key key,
    @required this.title,
    @required this.value,
    @required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).buttonColor,
                height: 1.17)),
        Container(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: MyColors.primary,
              inactiveTrackColor:
                  Theme.of(context).buttonColor.withOpacity(0.3),
              trackShape: CustomTrackShape(),
              trackHeight: 3,
              inactiveTickMarkColor: Colors.transparent,
              activeTickMarkColor: Colors.transparent,
              thumbShape: CustomSliderThumbRect(
                color: Theme.of(context).buttonColor,
                max: 10,
                min: 1,
                thumbHeight: 28,
                thumbRadius: 14,
              ),
              thumbColor: MyColors.primary,
            ),
            child: Slider(
              value: value,
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: onChange,
            ),
          ),
        )
      ],
    );
  }
}
