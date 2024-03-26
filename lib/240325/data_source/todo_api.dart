import 'dart:convert';

import 'package:http/http.dart' as http;

import '../todo.dart';

class TodoApi {
  Future<List<Todo>> getTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  Future<Todo> getTodo(int id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));

    final Map<String, dynamic> json = jsonDecode(response.body);
    return Todo.fromJson(json);
  }
}
