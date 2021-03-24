import "package:flutter/material.dart";
import "../widgets/NavBar.dart";
import "../widgets/RenderTodos.dart";
import "../widgets/InputBox.dart";
import "../widgets/AudioInput.dart";
import "../CentralState.dart";
import 'package:provider/provider.dart';
// class TodoItem {
//   String item;
//   TodoItem(String item) {
//     this.item = item;
//   }
// }

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
            child: Column(children: [NavBar(), RenderTodos(), InputBox()])));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool showAudioButton = context.watch<CentralState>().showAudioButton;

    return Scaffold(
        body: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  MainBody(),
                  Visibility(
                      child: Positioned(
                          bottom: 30, right: 30, child: AudioInput()),
                      visible: showAudioButton),
                ]))));
  }
}
