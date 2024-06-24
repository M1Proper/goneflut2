import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/todo_list_screen.dart';
import 'providers/todo_provider.dart';

void main() {
    runApp(TodoListApp());
}

class TodoListApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ChangeNotifierProvider(
            create: (context) => TodoProvider(),
            child: MaterialApp(
                title: 'Todo List',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                ),
                home: TodoListScreen(),
            ),
        );
    }
}