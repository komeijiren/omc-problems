import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class search extends ConsumerWidget{
  const search({Key? key}) : super(key: key);

  void _menu(){

  }
  void vert(){

  }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('OMCの問題集'),
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