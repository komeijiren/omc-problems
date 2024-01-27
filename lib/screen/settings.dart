import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omc/provider/indexprovider.dart';
import 'package:flutter/cupertino.dart';
class settings extends ConsumerStatefulWidget{
  const settings({Key? key}) : super(key: key);
  @override
  settingsState createState() => settingsState();
}
class settingsState extends ConsumerState<settings>{

  void _menu(){
  }
  void vert(){
  }
  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('設定'),
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
        body:Column(
          children: [
            ListTile(
              title: Text("自動ログイン"),
              trailing: CupertinoSwitch(
                value: ref.watch(autoLogin),
                onChanged: (value) {
                  ref.read(autoLogin.notifier).state = value;
                },
            ),
            ),
    TextField(
    decoration: InputDecoration(
    hintText: "Username",
    labelText: 'Username',
    prefixIcon: Icon(Icons.person),
    ),
    onSubmitted: (text) {
    ref.read(username.notifier).state = text;
    },


    ),
    TextField(
    decoration: InputDecoration(
    hintText: "password",
    labelText: 'password',
    prefixIcon: IconButton(
    icon: Icon(_obscureText? Icons.lock : Icons.lock_open),
    onPressed: () {
    _obscureText = !_obscureText;
    },
    )
    ),
    onChanged: (text) {
    ref.read(password.notifier).state = text;
    },
    obscureText: _obscureText,


    ),
            ListTile(
              title: Text("アドバンスモード"),
              trailing: CupertinoSwitch(
                value: ref.watch(advancemode),
                onChanged: (value) {
                  ref.read(advancemode.notifier).state = value;
                },
              ),
            )
    ],
        )
    );
  }
}