import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omc/screen/home.dart';
import 'package:omc/screen/search.dart';
import 'package:omc/screen/timer.dart';
final _selectedIndex = StateProvider<int>((ref) => 0);
class MyApp extends ConsumerWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'OMCの問題集',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'ホーム'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget{
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends ConsumerState<MyHomePage>{
  static const _screens = [
    home(),
    search(),
    timer(),
  ];
  void _onItemTapped(int index) {
    ref.read(_selectedIndex.notifier).state = index;
  }
  dynamic _search({int? index1 = 0}){
    ref.read(_selectedIndex.notifier).state = 1;
  }

  void _set(){
  }
  void _menu(){

  }
  void vert(){
  }
  @override
  Widget build(BuildContext context) {

    final _selectedIndex1 = ref.watch(_selectedIndex);
    return Scaffold(

      body: _screens[_selectedIndex1],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex1,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.mode), label: '問題'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'タイマー'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

