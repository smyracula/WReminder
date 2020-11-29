import 'package:WReminder/helper/text_helper.dart';
import 'package:WReminder/helper/ui_helper.dart';
import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<ReminderScreen> {
  final _controller = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIHelper.DARK_NAVY_BLUE_2,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: UIHelper.WHITE),
          backgroundColor: UIHelper.DARK_NAVY_BLUE,
          title: Text(
            TextHelper.word_reminder,
            style: TextStyle(
                fontFamily: 'Sailec',
                fontSize: 20,
                color: UIHelper.WHITE,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: PageView.builder(
                    physics: new AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: 999,
                    itemBuilder: (BuildContext context, int index) {
                      return WordPage();
                    },
                  )),
            ),
          ),
        ));
  }

}

class WordPage extends StatefulWidget {
  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  bool wordAnswerVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Apple",
            style: TextStyle(
                fontFamily: 'Sailec',
                color: UIHelper.ORANGE,
                fontSize: 80,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 50,
            decoration:
            BoxDecoration(border: Border.all(color: UIHelper.DARK_ORANGE),borderRadius: BorderRadius.circular(8.0)),
            child: FlatButton(
              child: Text("Elma",style: TextStyle(
                  fontFamily: 'Sailec',
                  color: wordAnswerVisibility ? UIHelper.DARK_ORANGE : Colors.transparent,
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700),),
              onPressed: () {
                setState(() {
                  wordAnswerVisibility = !wordAnswerVisibility;
                });
              },
            ),
          )
        ],
      ),
    );
  }

}