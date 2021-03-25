import "package:flutter/material.dart";
import '../CentralState.dart';
import 'package:provider/provider.dart';
import '../widgets/Category.dart';
import '../widgets/AddNewCategory.dart';
// class TodoItem {
//   String item;
//   TodoItem(String item) {
//     this.item = item;
//   }
// }

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bool showAudioButton = context.watch<CentralState>().showAudioButton;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87),
            shadowColor: Colors.grey[50],
            title: Text(
              'Choose Category',
              style: TextStyle(color: Colors.black87),
            ),
            backgroundColor: Colors.grey[200]),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
              child: Column(
            children: [RenderCategories(), AddNewCategory()],
          )),
        ));
  }
}

class RenderCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentCategory = context.watch<CentralState>().currentCategory;
    List categoryList = context.watch<CentralState>().categoryList;
    Function changeCategory = context.watch<CentralState>().changeCategory;

    List categoryListChanged = [...categoryList];
    categoryListChanged.add("general");

    return Column(
        children: categoryListChanged.map((category) {
      return Category(
          currentCategory: currentCategory,
          data: category,
          changeCategory: changeCategory);
    }).toList());
  }
}
