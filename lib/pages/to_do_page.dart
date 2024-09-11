import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  String greetingMessage = '';

  TextEditingController textEditingController = TextEditingController();

  void greetUser() {
    setState(() {
      greetingMessage = 'Hello' + textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(greetingMessage),
                TextField(
                        controller: textEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                      ),
                ElevatedButton(onPressed: greetUser, child: Text('Tap'))
              ],
            ),
          )),
    );
  }
}
