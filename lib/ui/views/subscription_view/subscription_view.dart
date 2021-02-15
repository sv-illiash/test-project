import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/views/subscription_view/subscription_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/choose_your_plan_item_widget.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:stacked/stacked.dart';

class SubscriptionView extends StatelessWidget {
  String getIcon(bool isDark) {
    return isDark
        ? "assets/close_icon_subscription_page.png"
        : "assets/close_light_t.png";
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubscriptionViewModel>.reactive(
        viewModelBuilder: () => SubscriptionViewModel(),
        builder: (buildContext, model, widget) {
          bool isDark = Get.theme.brightness == Brightness.dark;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const SizedBox(
                  height: 58,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => model.onBackPressed(),
                    child: Image.asset(
                      getIcon(isDark),
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).buttonColor),
                  ),
                ),
               const SizedBox(
                  height: 11,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You have 7 trial days left',
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).buttonColor)),
                ),
                const SizedBox(
                  height: 42.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Subscribe To Unlock:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).buttonColor),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/check_icon_subscription_page.png",
                          height: 20,
                          width: 20,
                          // color: color ?? Theme.of(context).buttonColor,
                        ),
                        const SizedBox(width: 9),
                        Text('+ 10k Books',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).buttonColor)),
                      ],
                    ),
                    const SizedBox(height: 13.0),
                    Row(
                      children: [
                        Image.asset(
                          "assets/check_icon_subscription_page.png",
                          height: 20,
                          width: 20,
                          //color: color ?? Theme.of(context).buttonColor,
                        ),
                        const SizedBox(width: 9),
                        Text('+ 7k Voices',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).buttonColor)),
                      ],
                    ),
                    const SizedBox(height: 13.0),
                    Row(
                      children: [
                        Image.asset(
                          "assets/check_icon_subscription_page.png",
                          height: 20,
                          width: 20,
                          //color: color ?? Theme.of(context).buttonColor,
                        ),
                        const SizedBox(width: 9),
                        Text('+ 23k Tasks',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).buttonColor)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 41.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Choose Your Plan',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Theme.of(context).buttonColor)),
                ),
                const SizedBox(height: 27.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChooseYourPlanItemWidget(
                      duration: 'Monthly',
                      cost: '6.99 €/month',
                      index: 0,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ChooseYourPlanItemWidget(
                      duration: 'Yearly',
                      cost: '49.99 €/year',
                      index: 1,
                    ),
                  ],
                ),

                const SizedBox(height: 17), //Cancel Anytime.

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Cancel Anytime.',
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).buttonColor)),
                ),
               const SizedBox(height: 12),
                Text(
                    'Payment will be charged to your Apple ID at time of purchase. Subscribtion automaticaly renews monthly unless it is canceled 24 hours before the current period. You can manage you subscriptions by going to your account settings on the App Store after purchase.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).buttonColor,
                      height: 1.42,
                    )),
                Expanded(
                  child: SizedBox(
                    height: 27.0,
                  ),
                ),

                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Text('Later',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).buttonColor,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ),
                    Flexible(flex: 3, child: MainButton(text: 'Subscribe')),
                  ],
                ),
                const SizedBox(
                  height: 27.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.values,
                  children: [
                    Text('Terms of use',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).buttonColor.withOpacity(0.7),
                          decoration: TextDecoration.underline,
                        )),
                    Text('Privacy Policy',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).buttonColor.withOpacity(0.7),
                          decoration: TextDecoration.underline,
                        ))
                  ],
                ),

               const SizedBox(
                  height: 40.0,
                )
              ]),
            ),
          );
        });
  }
}
