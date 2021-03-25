import "package:flutter/material.dart";
import "../widgets/RecordingBar.dart";
import '../controllers/SpeechToTextConvertor.dart';
import '../CentralState.dart';
import 'package:provider/provider.dart';
// class TodoItem {
//   String item;
//   TodoItem(String item) {
//     this.item = item;
//   }
// }

class AudioInput extends StatefulWidget {
  @override
  _AudioInputState createState() => _AudioInputState();
}

class _AudioInputState extends State<AudioInput> {
  String text = '';
  bool isListening = false;
  Function submitter;

  void submitTodo() {
    if (text == "") return;
    submitter(text);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    toggleRecording();
  }

  Future toggleRecording() => SpeechToTextConvertor.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);

          if (!isListening) {
            Future.delayed(Duration(seconds: 2), () {
              submitTodo();
            });
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    submitter = context.watch<CentralState>().addTodoItem;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          shadowColor: Colors.grey[50],
          title: Text(
            'Record Todo',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.grey[200]),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      "Listening...",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )),
          Positioned(left: 0, bottom: 0, child: RecordingBar(text))
        ]),
      ),
    );
  }
}
