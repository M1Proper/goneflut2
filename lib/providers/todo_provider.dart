import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
    List<Todo> _todos = [];

    List<Todo> get todos => _todos;

    TodoProvider() {
        _loadTodos();
    }

    void addTodo(Todo todo) {
        _todos.add(todo);
        _saveTodos();
        notifyListeners();
    }

    void _saveTodos() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('todos', jsonEncode(_todos.map((todo) => todo.toJson()).toList()));
    }

    void _loadTodos() async {
        final prefs = await SharedPreferences.getInstance();
        final todosString = prefs.getString('todos');
        if (todosString != null) {
            final List<dynamic> json = jsonDecode(todosString);
            _todos = json.map((item) => Todo.fromJson(item)).toList();
            notifyListeners();
        }
    }
}