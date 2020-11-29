import 'package:WReminder/helper/text_helper.dart';
import 'package:WReminder/helper/ui_helper.dart';
import 'package:flutter/material.dart';

class WordScreen extends StatefulWidget {
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<WordScreen> {
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