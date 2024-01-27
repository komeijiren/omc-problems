import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omc/screen/home.dart';
import 'package:omc/screen/search.dart';
import 'package:omc/screen/timer.dart';
import 'package:omc/screen/bookpage.dart';
import 'package:omc/screen/set1.dart';
import 'package:omc/provider/indexprovider.dart';
import 'package:omc/screen/settings.dart';
import 'package:omc/screen/advancedsearch.dart';
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
  late final _screens;
  @override
  void initState(){
    super.initState();
    _screens = [
      home(search: _search,
            book: book,
            set: set,),
      search(),
      timer(),
      bookpage(),
      set1(),
      settings(),
      adsearch(),
    ];
  }
  void _onItemTapped(int index) {
    ref.read(selectIndex.notifier).state = index;
  }
  void _search(){
    ref.read(selectIndex.notifier).state = 1;
  }
  void book(){
    ref.read(selectIndex.notifier).state = 3;
  }
  void set(){
    ref.read(selectIndex.notifier).state = 4;
  }
  void _menu(){

  }
  void vert(){
  }
  @override
  Widget build(BuildContext context) {

    final _selectedIndex1 = ref.watch(selectIndex);
    int _selectedIndex2 = 0;
    if(_selectedIndex1>=3){
      setState(() {
        _selectedIndex2 = 0;
      });
    }else() {
      setState(() {
        _selectedIndex2 = _selectedIndex1;
      });
    };
    return Scaffold(

      body: _screens[_selectedIndex1],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex2,
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

