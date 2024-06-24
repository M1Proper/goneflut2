import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

class AddTodoScreen extends StatelessWidget {
    final _titleController = TextEditingController();
    final _textController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Add Todo'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        TextField(
                            controller: _titleController,
                            decoration: InputDecoration(labelText: 'Title'),
                        ),
                        TextField(
                            controller: _textController,
                            decoration: InputDecoration(labelText: 'Text'),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                                final title = _titleController.text;
                                final text = _textController.text;
                                if (title.isNotEmpty && text.isNotEmpty) {
                                    final newTodo = Todo.create(title: title, text: text);
                                    Provider.of<TodoProvider>(context, listen: false).addTodo(newTodo);
                                    Navigator.pop(context);
                                }
                            },
                            child: Text('Add Todo'),
                        ),
                    ],
                ),
            ),
        );
    }
}