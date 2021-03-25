import "package:flutter/material.dart";
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextConvertor {
  static final _speech = SpeechToText();

  static Future<bool> toggleRecording({
    @required Function(String text) onResult,
    @required ValueChanged<bool> onListening,
  }) async {
    print("init speechSynth");
    if (_speech.isListening) {
      _speech.stop();
      return true;
    }

    final isAvailable = await _speech.initialize(
      onStatus: (status) => onListening(_speech.isListening),
      onError: (e) => print('Error: $e'),
    );

    if (isAvailable) {
      _speech.listen(onResult: (value) {
        onResult(value.recognizedWords);
        print(value.recognizedWords);
      });
    }

    return isAvailable;
  }
}
