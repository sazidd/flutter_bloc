import 'package:flutter/foundation.dart';

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.completed,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
