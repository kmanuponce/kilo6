import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kilo6/provider/todos.dart';
import 'package:kilo6/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
      final todos = provider.todosCompleted;
    
    return todos.isEmpty
        ? Center(
            child: Text(
              'No completed tasks.',
              style: TextStyle(fontSize: 20),
            ),
          )
    
        : ListView.separated(

          // when scroll it bounces BouncungScrollPhysics
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(18),
          separatorBuilder: (context, index) => Container(height: 10),

          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];

            return TodoWidget(todo: todo);
          },  
        );
  }
}
