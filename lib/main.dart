import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.orange,
    ),
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todo = [];
  String input = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context){
            return AlertDialog(
              title: Text("Add to do's"),
              content: TextField(
                onChanged: (String value){
                  input = value;
                },
              ),
              actions: <Widget>[
                FlatButton(onPressed:() {
                  setState(() {
                    todo.add(input);
                  });
                  Navigator.of(context).pop();
                }, child: Text("Add"))
              ],
            );
          });
        }
      ,child: Icon(
        Icons.add, color:
      Colors.white,),
      ),
      body: ListView.builder(
     itemCount: todo.length,
    itemBuilder: (BuildContext context, int index){
       return Dismissible(
    key: Key(todo[index]),
         child: Card(
    elevation: 4,
    margin: EdgeInsets.all(4),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8)
    ),
            child: ListTile(
             title: Text(todo[index]),
               trailing: IconButton(icon:
                Icon(Icons.delete, color: Colors.red,),
    onPressed: (){
    setState(() {
    todo.removeAt(index);
    });
    },
    ),
    ),
    ));
    })
    ,
  );

  }
}



