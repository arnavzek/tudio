import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CentralState with ChangeNotifier {
  List todoItems = <String>[];
  List categoryList = <String>[];
  String currentCategory = "general";

  bool showAudioButton = true;

  CentralState() {
    readCategories();
  }

  showButton(bool val) {
    showAudioButton = val;
    notifyListeners();
  }
  //run readTodoList();

  saveTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('$currentCategory todo', todoItems);
  }

  saveCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('categoryList', categoryList);
  }

  void readTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notifyListeners();
    todoItems = prefs.getStringList('$currentCategory todo') ?? <String>[];
    print(todoItems);
  }

  void readCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    categoryList = prefs.getStringList('categoryList') ?? <String>[];
    currentCategory = prefs.getString('currentCategory') ?? "general";
    this.readTodoList();
    notifyListeners();
  }

  void addCategory(newItem) {
    notifyListeners();
    categoryList.add(newItem);
    this.changeCategory(newItem);
    this.saveCategories();
  }

  void changeCategory(newItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentCategory', newItem);
    currentCategory = newItem;
    this.saveCategories();
    this.readTodoList();
    notifyListeners();
  }

  void addTodoItem(newItem) {
    notifyListeners();
    todoItems.add(newItem);
    this.saveTodoList();
  }

  void delete(item) {
    notifyListeners();
    todoItems.remove(item);
    this.saveTodoList();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties

}
