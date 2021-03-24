import "package:flutter/material.dart";

class ToDo extends StatefulWidget {
  final String todoData;
  final Function delete;
  ToDo({this.todoData, this.delete});

  @override
  ToDoState createState() => ToDoState();
}

class ToDoState extends State<ToDo> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTileTheme(
          contentPadding: EdgeInsets.all(0),
          child: CheckboxListTile(
            title: Text(widget.todoData),
            value: isOn,
            onChanged: (newValue) {
              widget.delete(widget.todoData);
              //_doSomething(newValue);
            },
            controlAffinity: ListTileControlAffinity.leading,
          )),
      Divider(
        thickness: 2,
      )
    ]);
  }
}
