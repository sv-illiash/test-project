import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/views/main_view/main_view_model.dart';
import 'package:my_book_reloaded/ui/widgets/bottom_navigation.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        builder: (buildContext, model, widget) {
          return Scaffold(
            bottomNavigationBar: BottomNavigation(
              currentTab: model.currentIndex,
              onSelectTab: model.onSelectTab,
            ),
            body: model.screen(),
          );
        });
  }
}
