import './data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './notifiers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      ),

    ],
    child: akhil(),
  ));
}

class akhil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlertDialogs',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AlertDialogs'),
        ),
        body: Center(
            child: ListView(
              children: ListTile.divideTiles(tiles: [

                ListTile(
                  title: Text('Single choice Dialog'),
                  onTap: () => _showSingleChoiceDialog(context),
                ),

                ListTile(
                    title: Text('TextField Dialog'),
                    onTap: () => _showAddNoteDialog(context))
              ], context: context)
                  .toList(),
            )));
  }



  _showSingleChoiceDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      final _singleNotifier = Provider.of<SingleNotifier>(context);
      return AlertDialog(
        title: Text('Select one country'),
        content: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: countries
                  .map((e) => RadioListTile(
                title: Text(e),
                value: e,
                groupValue: _singleNotifier.currentCountry,
                selected: _singleNotifier.currentCountry == e,
                onChanged: (value) {

                },
              ))
                  .toList(),
            ),
          ),
        ),
      );
    },
  );


  _showAddNoteDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add your note"),
        content: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Enter your note',
                      icon: Icon(Icons.note_add)),
                )
              ],
            ),
          ),
        ),
        actions: [
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
