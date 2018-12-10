import 'package:flutter/material.dart';
import 'ToDoItems.dart';
//GLOBAL VARIABLES

final String gTitle = "To Do List"; //Global Title
final ThemeData dTheme = ThemeData(); //Default Theme
ThemeData cTheme = dTheme; //Current Theme
String userName;
Center emptyList = Center(
	child: Text("Congrats" + ((userName != null) ? " " + userName : "") + ", looks like you've got some free time."),
);

List<ToDoItems> _toDoList = List<ToDoItems>();

//APP WORKINGS

void main() => runApp(ToDoListApp());

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: gTitle,
      theme: cTheme,
      home: ListHomePage(title: gTitle),
    );
  }
}

class ListHomePage extends StatefulWidget {
  ListHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListHomePageState createState() => _ListHomePageState();
}

class _ListHomePageState extends State<ListHomePage> {
  
  void _openSettings() {
//  	Navigator.of(context).push();
	}
	
	Widget _buildToDoList() {
  	return ListView.builder(
			itemCount: _toDoList.length * 2,
			itemBuilder: (BuildContext _context, int i) {
				if(i.isOdd) {
					bool completed = false;
					return ListTile(
						title: Text(_toDoList[i ~/ 2].toString()),
						trailing: IconButton(
							icon: !completed ? Icon(Icons.check_box_outline_blank) : Icon(Icons.check_box),
							onPressed: () {
								setState(() {
								  completed = true;
								});
							})
					);
				} else {
					return Divider();
				}
			});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
				actions: <Widget>[
					IconButton(
						icon: const Icon(Icons.settings),
						onPressed: _openSettings,
					)
				],
      ),
      body: (_toDoList.isEmpty) ? emptyList : _buildToDoList(),
    );
  }
}
