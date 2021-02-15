import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/timer_widget.dart';
import 'package:stacked/stacked.dart';

import 'base_template_view_model.dart';

class TimerTemplateView extends ViewModelWidget<BaseTemplateViewModel> {
  const TimerTemplateView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, BaseTemplateViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Text(
            "Think about your day ahead.How will you ensure you think improvement and high standards in everything you do today ",
            style: TextStyle(
                fontSize: 22,
                height: 1.45,
                color: Theme.of(context).buttonColor,
                fontWeight: FontWeight.w700),
          ),
          Flexible(
            child: Center(
              child: TimerWidget(),
            ),
          ),
          MainButton(text: "Next", onPressed: viewModel.onNextPage)
        ],
      ),
    );
  }
}
