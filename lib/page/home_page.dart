import 'package:flutter/material.dart';
import 'package:kilo6/main.dart';
import 'package:kilo6/widget/add_todo_dialog_widget.dart';
import 'package:kilo6/widget/completed_list_widget.dart';
import 'package:kilo6/widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // tap start @ index 0,
  // line37
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final tabs = [
      // items tap on BottomNavigationBarItem,
      // first page
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 50,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1468657988500-aca2be09f4c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'
                ),
              fit: BoxFit.cover,
              ),
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.cyanAccent,
        
        // which tap should be selected
        currentIndex: selectedIndex,
        // setState updates tap to update UI
        onTap: (index) => setState(() {
          // tap and switch tap,from BottomNavigationBar
          selectedIndex = index;
        }),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outline_rounded, size: 28),
            label: 'Completed',
          ),

        ],
      ),

      body: tabs[selectedIndex],

      // floatingActionButton 
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        
        backgroundColor: Colors.cyan[600],
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}