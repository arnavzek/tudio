import "package:flutter/material.dart";
import "./ToDo.dart";
import "../CentralState.dart";
import 'package:provider/provider.dart';

class RenderTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> todoItems = context.watch<CentralState>().todoItems;
    Function delete = context.read<CentralState>().delete;

    return Column(
        children: todoItems.map((todo) {
      return ToDo(todoData: todo, delete: delete);
    }).toList());
  }
}
