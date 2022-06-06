import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model_class.dart';
import 'package:todoapp/widgets/user_data.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: TodoApp(),
  ));
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var todoController = TextEditingController();
  final List<TodoModel> todoList = [];

  void addTodo() {
    int id = todoList.length + 1;
    int successiveId = id++;
    // final todoController = TextEditingController();
    final todo = todoController.text;
    final apphendTodo = TodoModel(todo, successiveId);
    if (todo.isEmpty) {
      return;
    }
    setState(() {
      todoController.clear();

      todoList.add(apphendTodo);
    });
    Navigator.of(context).pop();
  }

  void deleteTodo(int id) {
    // int id = todoList.length + 1;
    // int successiveId = id++;
    setState(() {
      todoList.removeWhere((list) {
        return list.id == id;
      });
    });
  }

  void showInput(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: null,
            behavior: HitTestBehavior.opaque,
            child: Container(
              margin: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: todoController,
                      onSubmitted: (_) => addTodo(),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter to-do'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: addTodo, child: const Text('Add To-do')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo-App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [UserTodo(todoList, deleteTodo)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showInput(context), child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
