import "package:flutter/material.dart";
import "../CentralState.dart";
import 'package:provider/provider.dart';

class InputBox extends StatefulWidget {
  InputBox();
  InputBoxState createState() => InputBoxState();
}

class InputBoxState extends State<InputBox> {
  final _focusNode = FocusNode();
  String newTodoData = "";
  TextEditingController txtController = TextEditingController();
  Function showButton;
  Function addTodoItem;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      showButton(!_focusNode.hasFocus);
      print("Has focus: ${_focusNode.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    showButton = context.read<CentralState>().showButton;
    addTodoItem = context.read<CentralState>().addTodoItem;
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: TextField(
          controller: txtController,
          onChanged: (newText) {
            setState(() {
              newTodoData = newText;
            });
          },
          onSubmitted: (_) {
            setState(() {
              if (newTodoData != "") {
                txtController.clear();
                addTodoItem(newTodoData);
                newTodoData = "";
              }
            });
          },
          focusNode: _focusNode,
          decoration: InputDecoration(hintText: "Write New Todo"),
        ));
  }
}
