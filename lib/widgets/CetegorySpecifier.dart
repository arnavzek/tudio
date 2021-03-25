import "package:flutter/material.dart";
import '../CentralState.dart';
import 'package:provider/provider.dart';

class CetegorySpecifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentCategory = context.read<CentralState>().currentCategory;
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/categories');
          },
          child: Container(
              margin: EdgeInsets.all(0),
              color: Colors.grey[200],
              padding: EdgeInsets.all(10),
              child: Text("category: $currentCategory")),
        ));
  }
}
