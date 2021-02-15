import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/success_view/success_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:stacked/stacked.dart';

class SuccessView extends StatefulWidget {
  final String title;
  final String nextRoute;

  const SuccessView({Key key, @required this.title, this.nextRoute})
      : super(key: key);

  @override
  _SuccessViewState createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessViewModel>.reactive(
        viewModelBuilder: () => SuccessViewModel(),
        onModelReady: (model) => model.init(widget.nextRoute, widget.title),
        builder: (buildContext, model, widget) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom + 60),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/succsess_check.png",
                          height: 150,
                          width: 150,
                        ),
                        SizedBox(
                          height: 47,
                        ),
                        Text(
                          model.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              height: 1.45,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  MainButton(
                    text: "Ok",
                    onPressed: model.onOkPressed,
                  )
                ],
              ),
            ),
          );
        });
  }
}
