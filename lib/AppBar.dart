import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarComponentWidget extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarComponentWidget({required this.title, super.key});
  String title;
  void _menu() {
  }
  void vert(){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}