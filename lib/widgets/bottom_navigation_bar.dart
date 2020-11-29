import 'package:WReminder/helper/text_helper.dart';
import 'package:WReminder/helper/ui_helper.dart';
import 'package:WReminder/icons/bottom_nav_bar_icons_icons.dart';
import 'package:WReminder/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_item.dart';

class WRBottomNavigationBar extends StatefulWidget {
  @override
  _WRBottomNavigationBarState createState() => _WRBottomNavigationBarState();
}

class _WRBottomNavigationBarState extends State<WRBottomNavigationBar> {
  setPage() {
    setState(() {
      pageController.jumpToPage(selectedPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Material(
        color: UIHelper.DARK_NAVY_BLUE,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: BottomNavigationItem(
                      setPage: setPage,
                      icon: BottomNavBarIcons.reminder,
                      id: 0,
                      text: TextHelper.reminder),
                  flex: 1),
              Expanded(
                  child: BottomNavigationItem(
                      setPage: setPage,
                      icon: BottomNavBarIcons.quiz,
                      id: 1,
                      text: TextHelper.quiz),
                  flex: 1),
              Expanded(
                  child: BottomNavigationItem(
                      setPage: setPage,
                      icon: BottomNavBarIcons.word,
                      id: 2,
                      text: TextHelper.word),
                  flex: 1),
              Expanded(
                  child: BottomNavigationItem(
                      setPage: setPage,
                      icon: BottomNavBarIcons.statistics,
                      id: 3,
                      text: TextHelper.stats),
                  flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
