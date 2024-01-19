import 'package:flutter/material.dart';
import 'package:omc/AppBar.dart';

class timer extends StatelessWidget{
  const timer({Key? key}) : super(key: key);
  void _menu(){

  }
  void vert(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('タイマー'),
        leading: IconButton(
            onPressed: _menu,
            icon: Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(
              onPressed: vert,
              icon: Icon(Icons.account_circle_outlined)
          ),
        ],
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}