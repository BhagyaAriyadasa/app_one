import 'package:app_one/data/database.dart';
import 'package:app_one/util/dialog_alert.dart';
import 'package:app_one/util/to_do_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDataBase db = ToDoDataBase();
  final _myBox = Hive.box("MyBox");
  final _controller = TextEditingController();

  @override
  void initState(){
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  void changeCheckBox(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateBox();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    db.updateBox();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTile(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("ToDo"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: db.toDoList[index][0],
              isCompleted: db.toDoList[index][1],
              onChanged: (value) => changeCheckBox(value, index),
              deleteFunction: (context) => deleteTile(index),
          );
        },
      ),
    );
  }
}
