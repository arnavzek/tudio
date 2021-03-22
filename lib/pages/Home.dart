import "package:flutter/material.dart";
import "../widgets/NavBar.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(children: [NavBar()]))));
  }
}
