import 'package:flutter/material.dart';
import 'package:todoapp/models/todo_model_class.dart';

class UserTodo extends StatelessWidget {
  // const UserTodo({Key? key}) : super(key: key);
  final List<TodoModel> usertodo;
  final Function deleteTodo;
  UserTodo(this.usertodo, this.deleteTodo);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount: usertodo.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: SizedBox(
                height: 70,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(usertodo[index].id.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 16.0))),
                          Text(
                            usertodo[index].todo,
                            style: TextStyle(fontSize: 18, color: Colors.grey[900]),
                          )
                        ]),
                         IconButton(onPressed: ()=>deleteTodo(usertodo[index].id),
                          icon: const Icon(Icons.delete),color: Colors.red,)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
