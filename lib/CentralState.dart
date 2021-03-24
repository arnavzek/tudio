import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CentralState with ChangeNotifier {
  List todoItems = <String>[];
  List categoryList = <String>[];
  String cetegory = "general";

  bool showAudioButton = true;

  CentralState() {
    readData();
  }

  showButton(bool val) {
    showAudioButton = val;
    notifyListeners();
  }
  //run readData();

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('$cetegory todo', todoItems);
  }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    todoItems = prefs.getStringList('$cetegory todo') ?? <String>[];
    print(todoItems);
  }

  void addTodoItem(newItem) {
    notifyListeners();
    todoItems.add(newItem);
    this.saveData();
  }

  void delete(item) {
    notifyListeners();
    todoItems.remove(item);
    this.saveData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties

}
