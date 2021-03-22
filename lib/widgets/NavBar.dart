import "package:flutter/material.dart";
import "./Logo.dart";
import "./Cetegory.dart";

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Logo(), Cetegory()]);
  }
}
