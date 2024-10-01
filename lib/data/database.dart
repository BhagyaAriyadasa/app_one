import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList = [];

  final _myBox = Hive.box("MyBox");

  //run this method if this is the first time ever open this app
  void createInitialData(){
    toDoList = [
      ["Exercise", false],
      ["Home work", false]
    ];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateBox(){
    _myBox.put("TODOLIST", toDoList);
  }
}