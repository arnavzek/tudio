import "package:flutter/material.dart";

class ToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTileTheme(
          contentPadding: EdgeInsets.all(0),
          child: CheckboxListTile(
            title: Text('Pickup grandma from the airport'),
            value: false,
            onChanged: (newValue) {
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
