import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/book_view/base_book_view_model.dart';
import 'package:stacked/stacked.dart';

class AboutTab extends ViewModelWidget<BaseBookViewModel> {
  const AboutTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, BaseBookViewModel viewModel) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 90,
              left: 20,
              top: 20,
              right: 20),
          child: Text(
            'Overcoming the pain, write down things you are avoiding'
            'spend time with your thoughts and ask yourself how things really are and how things could be in the future'
            'What assignments are you being guided towards? (Record or write your answer, whichever feels most comfortable to you). '
            'Now ask the Universe for help with it and rely on a power greater than you.'
            'List down the things you are grateful'
            'Write down your daily fears',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                height: 1.53,
                color: Theme.of(context).buttonColor),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.of(context).padding.bottom + 40),
              child: Image.asset(
                "assets/Group 12007.png",
                height: 71,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ))
      ],
    );
  }
}
