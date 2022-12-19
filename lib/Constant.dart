import 'package:hive_flutter/hive_flutter.dart';
part 'Constant.g.dart';
@HiveType(typeId:1)
 class Todo {
  @HiveField(0)

  final String TodoList;
  Todo({required this.TodoList});
 }