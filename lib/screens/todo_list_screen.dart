import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Todo List'),
            ),
            body: Consumer<TodoProvider>(
                builder: (context, todoProvider, child) {
                    return ListView.builder(
                        itemCount: todoProvider.todos.length,
                        itemBuilder: (context, index) {
                            final todo = todoProvider.todos[index];
                            return ListTile(
                                title: Text(todo.title),
                                subtitle: Text(todo.text),
                            );
                        },
                    );
                },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTodoScreen()),
                    );
                },
                child: Icon(Icons.add),
            ),
        );
    }
}