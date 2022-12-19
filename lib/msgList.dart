
import 'package:Todo/Constant.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Todo>> TodoListNotifier=ValueNotifier([]);

Future<void>  addTodo(Todo value)async {
  final todoDb=await Hive.openBox<Todo>('Todo');
  await todoDb.add(value);
  TodoListNotifier.value.add(value);
  TodoListNotifier.notifyListeners();
  print("...................................");
}

Future<void> getTodo() async{
  final todoDb=await Hive.openBox<Todo>('Todo');
  TodoListNotifier.value.clear();

  TodoListNotifier.value.addAll(todoDb.values);
  TodoListNotifier.notifyListeners();

}

Future<void> deleteTodo(int id)async{
  final tododb=await Hive.openBox<Todo>('Todo');
  tododb.delete(id);
}


