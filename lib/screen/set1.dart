import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class set1 extends ConsumerWidget{
  const set1({Key? key}) : super(key: key);

  void _menu(){

  }
  void vert(){

  }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('セット演習'),
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
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("On Development")
                ]))
    );
  }
}