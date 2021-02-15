import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/subscription_view/subscription_view_model.dart';
import 'package:stacked/stacked.dart';

class ChooseYourPlanItemWidget extends ViewModelWidget<SubscriptionViewModel> {
  final int index;
  final String duration;
  final String cost;

  ChooseYourPlanItemWidget({this.index, this.duration, this.cost});

  Color getBorderColor(int selectedIndex) {
    if (index == selectedIndex) {
      return MyColors.primary;
    } else {
      return Colors.transparent;
    }
  }

  Widget getBorderIcon(int selectedIndex) {
    if (index == selectedIndex) {
      return Stack(
        children: [
          Image.asset(
            "assets/rectangle_subscription_page.png",
            height: 26,
            width: 26,
          ),
          Positioned(
            top: 2,
            right: 3,
            child: Image.asset(
              "assets/check_icon.png",
              height: 18,
              width: 15,
              //color: color ?? Theme.of(context).buttonColor,
            ),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }


  @override
  Widget build(BuildContext context, SubscriptionViewModel viewModel) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: getBorderIcon(viewModel.selectedIndex)),
          Container(
            height: 72.0,

            decoration: BoxDecoration(
              color: Theme.of(context)
                  .secondaryHeaderColor,
                border: Border.all(
                    width: 1.4,
                    color: getBorderColor(viewModel.selectedIndex)),
                borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              splashColor: MyColors.primary.withOpacity(0.1),
              highlightColor: MyColors.primary.withOpacity(0.1),
              hoverColor: MyColors.primary.withOpacity(0.1),
              onTap: () => viewModel.onSelect(index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          duration,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).buttonColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          cost,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Theme.of(context).buttonColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: getBorderIcon(viewModel.selectedIndex)),
        ],
      ),
    );
  }
}

