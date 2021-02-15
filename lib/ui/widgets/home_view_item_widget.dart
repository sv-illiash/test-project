import 'package:flutter/material.dart';
import 'package:my_book_reloaded/core/models/book_object.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';
import 'package:my_book_reloaded/ui/views/home_view/home_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/remove_button.dart';
import 'package:stacked/stacked.dart';

class HomeViewItemWidget extends ViewModelWidget<HomeViewModel> {
  final BookObject bookObject;

  const HomeViewItemWidget({
    Key key,
    this.bookObject,
  }) : super(key: key);

  Color getBorderColor(int selectedIndex) {
    if (bookObject.index == selectedIndex) {
      return MyColors.primary;
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      child: Stack(
        children: [
          FlatButton(
            splashColor: MyColors.primary.withOpacity(0.1),
            highlightColor: MyColors.primary.withOpacity(0.1),
            hoverColor: MyColors.primary.withOpacity(0.1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.zero,
            onPressed: () => viewModel.onSelect(bookObject.index),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: getBorderColor(viewModel.selectedIndex)),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/${bookObject.image}",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    bookObject.title,
                    style: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        height: 1.75),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text("11 min",
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 22)),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: viewModel.isEdit,
            child: RemoveButton(),
          )
        ],
      ),
    );
  }
}
