import 'dart:convert';

import 'package:bloc_n/data/models/post.dart';
import 'package:bloc_n/data/models/todo.dart';
import 'package:http/http.dart' as http;

abstract class MainRepository {
  Future<List<dynamic>> getData();
}

class TodoRepository implements MainRepository {
  @override
  Future<List<Todo>> getData() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode == 200) {
      List todos = json.decode(response.body);
      return todos.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception();
    }
  }
}

class PostRepository implements MainRepository {
  @override
  Future<List<Post>> getData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      List posts = json.decode(response.body);
      return posts.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception();
    }
  }
}

class NetworkException implements Exception {}
