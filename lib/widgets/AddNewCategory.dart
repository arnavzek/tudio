import "package:flutter/material.dart";
import '../CentralState.dart';
import 'package:provider/provider.dart';

class AddNewCategory extends StatefulWidget {
  AddNewCategory();
  InputBoxState createState() => InputBoxState();
}

class InputBoxState extends State<AddNewCategory> {
  final _focusNode = FocusNode();
  String newCategoryName = "";
  TextEditingController txtController = TextEditingController();
  Function addCategory;

  @override
  Widget build(BuildContext context) {
    addCategory = context.read<CentralState>().addCategory;
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: TextField(
          controller: txtController,
          onChanged: (newText) {
            setState(() {
              newCategoryName = newText;
            });
          },
          onSubmitted: (_) {
            setState(() {
              if (newCategoryName != "") {
                txtController.clear();
                addCategory(newCategoryName);
                newCategoryName = "";
              }
            });
          },
          focusNode: _focusNode,
          decoration: InputDecoration(hintText: "Write New Category name"),
        ));
  }
}
