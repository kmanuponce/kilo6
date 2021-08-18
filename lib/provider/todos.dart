import 'package:flutter/cupertino.dart';
import 'package:kilo6/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Hawaii',
      description: '''- Ask Mommy to pickup 
- Eat some local food
- Pack gifts''',
    ),
    
    Todo(
      createdTime: DateTime.now(),
      title: 'Walk the Kaleo 🐕',
    ),
    
    Todo(
      createdTime: DateTime.now(),
      title: "Plan Manu's birthday party 🎉🥳",
    ),

    Todo(
      createdTime: DateTime.now(),
      title: 'Go grocery shopping',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted => 
    _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    
    // updates UI
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  } 

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}