import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kilo6/page/home_page.dart';
import 'package:kilo6/provider/todos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Kilo App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData.dark().copyWith(
            textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.black54),
            ),
          ),
          home: HomePage(),
        ),
      );
}
