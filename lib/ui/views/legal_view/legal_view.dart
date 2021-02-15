import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/legal_view/legal_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/my_app_bar.dart';
import 'package:stacked/stacked.dart';

class LegalView extends StatefulWidget {
  final String data;

  const LegalView({Key key, this.data}) : super(key: key);

  @override
  _LegalViewState createState() => _LegalViewState();
}

class _LegalViewState extends State<LegalView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LegalViewModel>.reactive(
        viewModelBuilder: () => LegalViewModel(widget.data),
        onModelReady: (model) => model.getData(),
        builder: (buildContext, model, widget) {
          return Scaffold(
            body: model.isBusy
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      MyAppBar(
                        title: model.legalObject?.title ?? "",
                        onBackPressed: model.onBackPressed,
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 17),
                          itemCount: model.legalObject.list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                model.legalObject.list[index],
                                style: TextStyle(
                                  fontSize: index == 0 ? 22 : 14,
                                  height: index == 0 ? 1.33 : 1.42,
                                  fontWeight: index == 0
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                  color: index == 0
                                      ? Theme.of(context).buttonColor
                                      : Theme.of(context)
                                          .buttonColor
                                          .withOpacity(0.7),
                                ),
                              ),
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
