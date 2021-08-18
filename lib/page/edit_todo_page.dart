import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kilo6/model/todo.dart';
import 'package:kilo6/provider/todos.dart';
import 'package:kilo6/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}


class _EditTodoPageState extends State<EditTodoPage> {
  // make sure title is always filled
  final _formKey = GlobalKey<FormState>();

  // will put title and description 
  String title;
  String description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Edit Log'),
      actions: [
        IconButton(
          icon: Icon(Icons.delete), 
          onPressed: () {
            final provider =
              Provider.of<TodosProvider>(context, listen: false);
            provider.removeTodo(widget.todo);

            Navigator.of(context).pop();
          } 
          )
      ],
    ),

    body: Padding(
      padding: EdgeInsets.all(18),
      child: Form(
        // line20 GlobalKey<FormState>
        key: _formKey,
        child: TodoFormWidget(
          title: title,
          description: description,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
            setState(() => this.description = description),
          onSavedTodo: saveTodo,
          
        ),
      ),
    ),
  );

  // saveTodo METHOD line51
  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }

}