import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inicial/add_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue.shade500,
        brightness: Brightness.dark
      ),
      home: HomePage(title: 'Aplicación de notas'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];

  List filled = List.filled(20, 0);

  void addNote(String newNote) {
    setState(() {
      notes.add(newNote);
    });
  }

  void _changePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddPage(
          addNote: this.addNote,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: notes.isEmpty
            ? Center(
                child: Text("No hay Notas"),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: this.notes.length,
                itemBuilder: (context, index) => ListTile(
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                  title: Text(
                    this.notes[index],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changePage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
