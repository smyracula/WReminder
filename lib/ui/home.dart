import 'package:WReminder/helper/ui_helper.dart';
import 'package:WReminder/ui/reminder.dart';
import 'package:WReminder/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

int selectedPosition = 0;
PageController pageController;

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  Widget appBarSelectedWidget;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.DARK_GREY,
      body: bodyContainer(),
      bottomNavigationBar: WRBottomNavigationBar(),
    );
  }

  Widget bodyContainer() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        ReminderScreen(),
        ReminderScreen(),
        ReminderScreen(),
        ReminderScreen()
      ],
    );
  }
}
