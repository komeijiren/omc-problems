import 'package:flutter/material.dart';
import 'package:cupertino_timer/cupertino_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omc/provider/indexprovider.dart';
class timer extends ConsumerStatefulWidget {
  const timer({Key? key}) : super(key: key);
  @override
  _timerState createState() => _timerState();
}
class _timerState extends ConsumerState<timer>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  void _menu() {
  }
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
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
              onPressed: (){
                ref.read(selectIndex.notifier).state = 5;
              },
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