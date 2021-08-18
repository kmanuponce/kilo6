import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  
  String title;
  
  // unique id
  String id;
  
  String description;
  
  // is it inside of "todos" or "completed"
  bool isDone;

  // CONSTRUCTOR w/ the following inside
  Todo({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}

