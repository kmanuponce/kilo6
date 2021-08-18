import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key key,
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(height: 8),
            buildDescription(),
            SizedBox(height: 32),
            buildButton(),
          ],
        ),
      );

  // title
  Widget buildTitle() => TextFormField(
        
        // How many lines you input
        maxLines: 1,
        
        initialValue: title,
        
        // everytime type, TodoDialog
        onChanged: onChangedTitle,
        
        // make sure TITLE is always filled
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },

        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        
        initialValue: description,
        
        onChanged: onChangedDescription,
        
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          // style:TextF
          labelText: 'Description',
        ),
      );

  //BUTTON_save
  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: onSavedTodo,
          child: Text('Save'),
        ),
      );
}