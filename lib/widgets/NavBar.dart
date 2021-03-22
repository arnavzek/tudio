import "package:flutter/material.dart";
import "./Logo.dart";
import "./Cetegory.dart";

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Logo(), Cetegory()]));
  }
}
