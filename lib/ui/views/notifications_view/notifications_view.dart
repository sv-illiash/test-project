import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/views/notifications_view/notifications_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/account_item.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:stacked/stacked.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
        viewModelBuilder: () => NotificationsViewModel(),
        onModelReady: (model) => model.getBooksList(),
        builder: (buildContext, model, widget) {
          return Scaffold(
            body: Column(
              children: [
                MyAppBar(
                  title: "Notifications",
                  onBackPressed: model.onBackPressed,
                ),
                Expanded(
                  child: model.isBusy
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: model.list.length,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (context, index) {
                            BookObject bookObject = model.list[index];
                            return AccountItem.switcher(
                              title: bookObject.title,
                              value: bookObject.notification,
                              onChanged: (value) =>
                                  model.onSwitcherChange(value, index),
                            );
                          },
                        ),
                )
              ],
            ),
          );
        });
  }
}
