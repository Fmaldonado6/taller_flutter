import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  final Function(String) addNote;

  const AddPage({Key key, @required this.addNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newNoteValue = "";

    void _valueChanged(String value) {
      newNoteValue = value;
    }

    _addNote() {
      if (newNoteValue.isEmpty)
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Input vacío"),
          ),
        );
      this.addNote(newNoteValue);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir nota"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: _valueChanged,
              decoration: InputDecoration(
                labelText: "Nota",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _addNote,
                child: Text("Añadir nota"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
