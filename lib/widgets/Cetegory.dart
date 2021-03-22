import "package:flutter/material.dart";

class Cetegory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
            margin: EdgeInsets.all(0),
            color: Colors.grey[200],
            padding: EdgeInsets.all(10),
            child: Text("category: General")));
  }
}
