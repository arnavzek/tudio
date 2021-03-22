import "package:flutter/material.dart";

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CheckboxListTile(
        title: Text('this is my title'),
        value: false,
        onChanged: (newValue) {
          //_doSomething(newValue);
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
      Divider()
    ]);
  }
}
