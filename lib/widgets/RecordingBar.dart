import "package:flutter/material.dart";
import "../CentralState.dart";
import 'package:provider/provider.dart';

class AudioButton extends StatelessWidget {
  final String txt;
  final Function callback;
  AudioButton({this.txt, this.callback});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callback,
        child: Container(
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(25),
          height: 75,
          width: 75,
          child: Text(txt,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(500),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
        ));
  }
}

class RecordingBar extends StatelessWidget {
  final String txt;

  RecordingBar(this.txt);

  @override
  Widget build(BuildContext context) {
    Function addTodoItem = context.watch<CentralState>().addTodoItem;

    void goBack() {
      Navigator.of(context).pop();
    }

    void successCallback() {
      addTodoItem(txt);
      goBack();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        AudioButton(txt: "✕", callback: goBack),
        AudioButton(txt: "✓", callback: successCallback)
      ]),
    );
  }
}
