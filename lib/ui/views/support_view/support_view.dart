import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/core/models/support_model.dart';
import 'package:my_book_reloaded/ui/views/support_view/support_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:my_book_reloaded/ui/widgets/my_expansion_tile.dart';
import 'package:stacked/stacked.dart';

class SupportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SupportViewModel>.reactive(
        viewModelBuilder: () => SupportViewModel(),
        builder: (buildContext, model, widget) {
          return Scaffold(
            body: Column(
              children: [
                MyAppBar(
                  title: "Support",
                  onBackPressed: model.onBackPressed,
                ),
                Expanded(
                  child: FutureBuilder<SupportModel>(
                      future: model.getSupportList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          SupportModel supportModel = snapshot.data;
                          return ListView.builder(
                            itemCount: supportModel.list.length,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            itemBuilder: (context, index) {
                              return MyExpansionTile(
                                title: supportModel.list[index].title,
                                children: [
                                  Text(
                                    supportModel.list[index].description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.42,
                                        color: Theme.of(context)
                                            .buttonColor
                                            .withOpacity(0.7)),
                                  )
                                ],
                              );
                            },
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                )
              ],
            ),
          );
        });
  }
}
