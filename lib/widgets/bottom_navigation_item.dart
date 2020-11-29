import 'package:WReminder/helper/ui_helper.dart';
import 'package:WReminder/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final int id;
  final Function setPage;
  final String text;

  const BottomNavigationItem({this.setPage, this.icon, this.id, this.text});

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedPosition = id;
        setPage();
      },
      child: SizedBox(
        height: 60,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
                width: (MediaQuery.of(context).size.width - 12) / 4,
                child: Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 25,
                          width: (MediaQuery.of(context).size.width - 12) / 4,
                          decoration: BoxDecoration(),
                          child: Icon(
                            icon,
                            color: selectedPosition == id
                                ? UIHelper.MID_ORANGE
                                : UIHelper.BROWN ,
                            size:  22,
                          ),
                        )),
                    SizedBox(
                      height: 0,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        text,
                        style: TextStyle(
                            fontFamily: 'Sailec',
                            color: selectedPosition == id
                                ? UIHelper.MID_ORANGE
                                : UIHelper.BROWN,
                            // UIHelper.WHITE,
                            fontSize: 12,
                            // UIHelper.dynamicSp(13),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
