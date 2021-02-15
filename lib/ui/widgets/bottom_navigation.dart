import 'package:flutter/material.dart';
import 'package:my_book_reloaded/ui/shared/my_colors.dart';

class BottomNavigation extends StatefulWidget {
  final ValueChanged<int> onSelectTab;
  final int currentTab;

  BottomNavigation(
      {Key key, @required this.currentTab, @required this.onSelectTab})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final TextStyle _textStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w600);

  List<BottomNavigationBarItem> _items;

  @override
  void initState() {
    super.initState();
    _setItem();
  }

  _setItem() {
    _items = [
      BottomNavigationBarItem(
          label: "Home",
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 5),
            child: ImageIcon(
              AssetImage("assets/home_icon.png"),
            ),
          )),
      BottomNavigationBarItem(
        label: "Explore",
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          child: ImageIcon(AssetImage("assets/search_icon.png")),
        ),
      ),
      BottomNavigationBarItem(
          label: "Stats",
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 5),
            child: ImageIcon(AssetImage("assets/stats_icon.png")),
          )),
      BottomNavigationBarItem(
          label: "Account",
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 5),
            child: ImageIcon(AssetImage("assets/account_icon.png")),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).buttonColor.withOpacity(0.1),
                  width: 1))),
      child: BottomNavigationBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        selectedItemColor: MyColors.primary,
        unselectedItemColor: Theme.of(context).buttonColor.withOpacity(0.7),
        items: _items,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        iconSize: 23,
        elevation: 0,
        selectedLabelStyle: _textStyle,
        unselectedLabelStyle: _textStyle,
        currentIndex: widget.currentTab,
        onTap: widget.onSelectTab,
      ),
    );
  }
}
