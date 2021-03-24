import 'package:flutter/material.dart';
import "./pages/Home.dart";
import "./CentralState.dart";
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CentralState()),
    ], child: MaterialApp(home: Home()));
  }
}
