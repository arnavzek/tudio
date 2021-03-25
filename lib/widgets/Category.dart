import "package:flutter/material.dart";

class Category extends StatefulWidget {
  final String data;
  final String currentCategory;
  final Function changeCategory;
  Category({this.data, this.changeCategory, this.currentCategory});

  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTileTheme(
          contentPadding: EdgeInsets.all(0),
          child: RadioListTile(
            value: widget.data,
            groupValue: widget.currentCategory,
            onChanged: (ind) {
              widget.changeCategory(widget.data);
            },
            title: Text(widget.data),
          )),
      Divider(
        thickness: 2,
      )
    ]);
  }
}
