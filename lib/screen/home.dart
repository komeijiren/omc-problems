
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omc/provider/indexprovider.dart';
class home extends ConsumerWidget{
  const home({Key? key, this.search, this.book, this.set,}) : super(key: key);
  final VoidCallback? search;
  final VoidCallback? book;
  final VoidCallback? set;
  void _menu(){

  }
  void vert(){

  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('OMCの問題集'),
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
          child: Column(
            children: <Widget>[
              InkWell(
                  onTap: this.search,
                  child: Card(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget> [
                            ListTile(
                              leading: Icon(Icons.search_rounded),
                              title: Text('問題検索'),
                              subtitle: Text('OMCのサイトで問題を検索'),
                            )
                          ]
                      )
                  )
              ),
              InkWell(
                  onTap: this.book,
                  child:Card(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget> [
                            ListTile(
                              leading: Icon(Icons.search_rounded),
                              title: Text('ブックマーク'),
                              subtitle: Text('ブックマークされた問題を表示'),
                            )
                          ]
                      )
                  )
              ),
              InkWell(
                  onTap: this.set,
                  child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.folder),
                            title: Text('セット演習'),
                            subtitle: Text('過去問からセットを作成'),

                          )
                        ],
                      )
                  )
              )
            ],
          )
      ),
    );

  }
}
