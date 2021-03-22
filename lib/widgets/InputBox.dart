import "package:flutter/material.dart";

class InputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: TextField(
          decoration: InputDecoration(hintText: "Write New Todo"),
        ));
  }
}
