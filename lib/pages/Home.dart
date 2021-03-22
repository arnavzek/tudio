import "package:flutter/material.dart";
import "../widgets/NavBar.dart";
import "../widgets/ToDo.dart";
import "../widgets/InputBox.dart";
import "../widgets/AudioInput.dart";

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Column(children: [NavBar(), ToDo(), ToDo(), InputBox()]));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Positioned(bottom: 30, left: 0, child: AudioInput()),
      MainBody()
    ])));
  }
}
