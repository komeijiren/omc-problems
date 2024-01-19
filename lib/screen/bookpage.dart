import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookmarkProvider = StateProvider<Map<String, String>>((ref) => {"null":'null'});
class bookpage extends ConsumerWidget{
  const bookpage({Key? key}) : super(key: key);
  void _menu(){

  }
  void vert(){

  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch<Map<String, String>>(bookmarkProvider); //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ブックマーク'),
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
            child: ListView.builder(
            itemCount: book.length,
            itemBuilder: (context, index) {
            var key = book.keys.elementAt(index);
             return Card(
            child: ListTile(
            title: Text('$key : ${book[key]}'),
            ),
            );
            }
        )
      ),
    );
  }
}