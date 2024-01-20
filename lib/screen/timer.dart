import 'package:flutter/material.dart';
import 'package:cupertino_timer/cupertino_timer.dart';

class timer extends StatefulWidget {
  const timer({Key? key}) : super(key: key);
  @override
  _timerState createState() => _timerState();
}
class _timerState extends State<timer>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  void _menu() {
  }
  void vert() {
  }
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              child: CupertinoTimer(
                duration: Duration(minutes: 1),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: 200,
              height: 200,
              child: CupertinoTimer(
                duration: Duration(minutes: 1),
                startOnInit: true,
                timeStyle: TextStyle(
                    fontFamily: 'Avenir Next', fontWeight: FontWeight.bold),
                ringColor: Colors.blue,
                ringStroke: 10,
                controller: this.controller,
              ),
            ),
            TextButton(
                onPressed: () {
                  this.controller.forward();
                },
                child: Text("Start")),
            TextButton(
                onPressed: () {
                  this.controller.stop();
                },
                child: Text("Pause")),
            TextButton(
                onPressed: () {
                  this.controller.reset();
                },
                child: Text("Reset")),
          ],
        ),
      ),
    );
  }
}