import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/widgets/account_item.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'account_view_model.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
        viewModelBuilder: () => AccountViewModel(),
        builder: (buildContext, model, widget) {
          return Scaffold(
            body: Column(
              children: [
                MyAppBar(title: "Account"),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    physics: BouncingScrollPhysics(),
                    children: [
                      AccountItem(
                        icon: "membership_icon.png",
                        title: "Input Template",
                        onPressed: () => model.openInputTemplateView(),
                      ),
                      AccountItem(
                        icon: "membership_icon.png",
                        title: "Manage membership status",
                        onPressed: () => model.openSubscriptionView('subscription.json'),
                      ),
                      AccountItem(
                        icon: "privacy_icon.png",
                        title: "Privacy Policy",
                        onPressed: () => model.openLegalView("privacy.json"),
                      ),
                      AccountItem(
                        icon: "notifications_icon.png",
                        title: "Notifications",
                        onPressed: model.openNotifications,
                      ),
                      AccountItem(
                        icon: "terms_icon.png",
                        title: "Terms And Services",
                        onPressed: () => model.openLegalView("terms.json"),
                      ),
                      AccountItem(
                        icon: "feedback_icon.png",
                        title: "Feedback",
                        onPressed: model.openFeedbackDialog,
                      ),
                      AccountItem(
                        icon: "account_info_icon.png",
                        title: "Account Info",
                        onPressed: model.openAccountInfo,
                      ),
                      AccountItem(
                        icon: "support_icon.png",
                        title: "Support",
                        onPressed: model.openSupport,
                      ),
                      AccountItem.switcher(
                        icon: "dark_mode_icon.png",
                        title: "Dark mode",
                        value: model.isDark,
                        onChanged: model.onThemeChange,
                      ),
                      AccountItem(
                        icon: "log_out_icon.png",
                        title: "Log Out",
                        color: MyColors.red,
                        isBorder: false,
                        suffixIconName: null,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
