import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omc/provider/indexprovider.dart';

class bookpage extends ConsumerWidget{
  const bookpage({Key? key}) : super(key: key);
  void _menu(){
  }
  void vert(){
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch<Map<String, String>>(bookmarkProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ブックマーク'),
        leading: IconButton(
            onPressed: _menu,
            icon: Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                ref.read(selectIndex.notifier).state = 5;
              },
              icon: Icon(Icons.account_circle_outlined)
          ),
        ],
      ),
      body: Center(
            child: ListView.builder(
            itemCount: book.length,
            itemBuilder: (context, index) {
            var key = book.keys.elementAt(index);
             return Dismissible(
                 key: Key('$key'),
                  onDismissed: (direction) {
                   book.remove(key);
                 },
               child : InkWell(
               onTap: (){
                 ref.read(urlprovider.notifier).state = '${book[key]}';
                ref.read(selectIndex.notifier).state = 1;
            }
               ,
                 child: Card(
                 child:
                Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
            ListTile(
            title: Text('$key'),
            subtitle: Text('${book[key]}'),
            ),

              ]
            ),
            ),
             )
             );

            }
        )
      ),
    );
  }
}