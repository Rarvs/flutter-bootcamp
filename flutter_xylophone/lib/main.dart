import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: XylophoneNotesPage(),
        ),
      ),
    );
  }
}

class XylophoneNotesPage extends StatefulWidget {
  @override
  _XylophoneNotesPageState createState() => _XylophoneNotesPageState();
}

class _XylophoneNotesPageState extends State<XylophoneNotesPage> {
  int note = 1;

  void setNote(int noteAssetId) {
    setState(() {
      note = noteAssetId;
    });
    print('Note: $note');
  }

  Widget buildKey({required int keyNote, required Color keyColor}) {
    return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(2.0),
          ),
          onPressed: () {
            setNote(keyNote);
          },
          child: Container(color: keyColor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildKey(keyNote: 1, keyColor: Colors.red),
        buildKey(keyNote: 2, keyColor: Colors.redAccent),
        buildKey(keyNote: 3, keyColor: Colors.amber),
        buildKey(keyNote: 4, keyColor: Colors.green.shade900),
        buildKey(keyNote: 5, keyColor: Colors.cyan.shade300),
        buildKey(keyNote: 6, keyColor: Colors.blueAccent),
        buildKey(keyNote: 7, keyColor: Colors.deepPurple.shade400)
      ],
    );
  }
}
