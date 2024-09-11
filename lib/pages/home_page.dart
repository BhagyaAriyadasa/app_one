import 'package:app_one/util/to_do_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List toDoList = [
    ["Make Tutorial",true],
    ["Do Exercise", false]
  ];

  void changeCheckBox(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("ToDo"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
              taskName: toDoList[index][0],
              isCompleted: toDoList[index][1],
              onChanged: (value) => changeCheckBox(value, index)
          );
        },
      ),
    );
  }
}
