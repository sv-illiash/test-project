import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:my_book_reloaded/ui/widgets/feedback_dialog/feedback_dialog_model.dart';
import 'package:my_book_reloaded/ui/widgets/main_button.dart';
import 'package:my_book_reloaded/ui/widgets/my_text_field.dart';
import 'package:my_book_reloaded/ui/widgets/remove_button.dart';
import 'package:stacked/stacked.dart';

class FeedbackDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.theme.brightness == Brightness.dark;
    return ViewModelBuilder<FeedbackDialogModel>.reactive(
        viewModelBuilder: () => FeedbackDialogModel(),
        builder: (buildContext, model, widget) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              height: 404,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RemoveButton(
                    buttonColor: Colors.white,
                    iconColor: Colors.black,
                    margin: EdgeInsets.only(bottom: 13),
                    onPressed: model.onCancel,
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      height: 365,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isDark ? Color(0xFF40434A) : Colors.white,
                      ),
                      child: ListView(
                        padding: EdgeInsets.only(top: 23, bottom: 29),
                        children: [
                          Center(
                            child: Text(
                              "Write a review",
                              style: TextStyle(
                                  color: Theme.of(context).buttonColor,
                                  fontSize: 22,
                                  height: 1.2,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RatingBar(
                              initialRating: 3,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              glow: false,
                              itemSize: 22,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: Image.asset('assets/icons/star.png'),
                                empty:
                                    Image.asset('assets/icons/empty_star.png'),
                                half:
                                    Image.asset('assets/icons/empty_star.png'),
                              ),
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          MyTextField(
                            margin: EdgeInsets.only(bottom: 15, top: 16),
                            hintText: "Enter title",
                            obscureText: false,
                            labelText: "Title",
                          ),
                          MyTextField.multiline(
                            margin: EdgeInsets.only(bottom: 20),
                            hintText: "Enter review",
                            height: 94,
                            obscureText: false,
                            labelText: "Review",
                          ),
                          MainButton(
                            text: "Submit",
                            onPressed: model.onApply,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
