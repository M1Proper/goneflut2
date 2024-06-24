import 'package:uuid/uuid.dart';

class Todo {
    final String id;
    final String title;
    final String text;

    Todo({
        required this.id,
        required this.title,
        required this.text,
    });

    factory Todo.create({required String title, required String text}) {
        return Todo(
            id: Uuid().v4(),
            title: title,
            text: text,
        );
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'text': text,
    };

    factory Todo.fromJson(Map<String, dynamic> json) {
        return Todo(
            id: json['id'],
            title: json['title'],
            text: json['text'],
        );
    }
}