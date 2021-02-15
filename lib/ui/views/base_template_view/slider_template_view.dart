import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/base_template_view/base_template_view_model.dart';
import 'package:my_book_reloaded/ui/views/chapter_view/chapter_slider_body.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/timer_widget.dart';
import 'package:stacked/stacked.dart';

class SliderTemplateView extends ViewModelWidget<BaseTemplateViewModel> {
  const SliderTemplateView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, BaseTemplateViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text(
            "Set 3 goals from the 30 day improvement guide.",
            style: TextStyle(
                fontSize: 22,
                height: 1.45,
                color: Theme.of(context).buttonColor,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12,),
          Text(
            "Rate on a scale of 1-10 how you current perform the following. A. "
            "Break the habit of putting things off B. Acquire the habit of complimenting people at every possible opportunity C. "
            "Do a better job at developing my subordinates D. Show more appreciation for the little things your partner does",
            style: TextStyle(
                fontSize: 14,
                height: 1.71,
                color: Theme.of(context).buttonColor.withOpacity(0.7),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Scrollbar(
              thickness: 4,
              radius: Radius.circular(6),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SliderItem(
                          value: 5,
                          title: "A. Break the habit of putting things off",
                          onChange: (value) {},
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SliderItem(
                          value: 5,
                          title: "B. Acquire the habit of complimenting people at every possible opportunity",
                          onChange: (value) {},
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 6,),
          Expanded(
            child: Center(
              child: TimerWidget(
                radius: 95,
              ),
            ),
          ),
          SizedBox(height: 6,),
          MainButton(text: "Next", onPressed: viewModel.onNextPage)
        ],
      ),
    );
  }
}
