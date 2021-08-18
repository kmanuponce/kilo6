import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:kilo6/model/todo.dart';
import 'package:kilo6/page/edit_todo_page.dart';
import 'package:kilo6/provider/todos.dart';
import 'package:kilo6/utils.dart';

class TodoWidget extends StatelessWidget {
  // @override
  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    
    // round the task cards
    borderRadius: BorderRadius.circular(18),
  
    child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),

          // BUTTON-slidable Edit
          actions: [
            IconSlideAction(
              color: Colors.tealAccent[700],
              onTap: () => editTodo(context, todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],

          // BUTTON-slidable Delete
          secondaryActions: [
            IconSlideAction(
              color: Colors.red[400],
              onTap: () => deleteTodo(context, todo),
              caption: 'Delete',
              icon: Icons.delete,
            )
          ],
          
          child: buildTodo(context),
        ),
  );
  
  Widget buildTodo(BuildContext context) => GestureDetector(
    // when click on card, 
    // can go to edit mode
    onTap: () => editTodo(context, todo),
    
    child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[500],
          
          child: Row(
            // CHECKBOX
            children: [
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.cyanAccent,
                  value: todo.isDone,
                  onChanged: (_) {
                    final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                    final isDone = provider.toggleTodoStatus(todo);
  
                    Utils.showSnackBar(
                    context, 
                    isDone ? 'Task completed' : 'Task marked incomple',
                    );
                  },
                ),
                const SizedBox(width: 20),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                        ),
                      ),
                      
                      // if description.isNotEmpty
                      if (todo.description.isNotEmpty)
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            todo.description,
                            style: TextStyle(fontSize: 20, height: 1.5), 
                          ),
                        ),
  
                    ],
                  ),
                ),
            ] 
          ),
      ),
  );

    // DELETE-todo METHOD
  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  // EDIT-todo Method
  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
  