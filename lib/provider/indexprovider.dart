import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final bookmarkProvider = StateProvider<Map<String, String>>((ref) => {"OMC194(A)":'https://onlinemathcontest.com/contests/omc194/tasks/2351'});
final urlprovider = StateProvider<String>((ref) => 'https://onlinemathcontest.com/login/');
final selectIndex = StateProvider<int>((ref) => 0);
final username = StateProvider<String>((ref) => '');
final password = StateProvider<String>((ref) => '');
final autoLogin = StateProvider<bool>((ref) => false);
final advancemode = StateProvider<bool>((ref) => false);
final int index = 0;
class indexNotifier extends ChangeNotifier{
  void _onItemTapped(int index){
    notifyListeners();
    
  }
}
class indexprovider extends ConsumerWidget {
  const indexprovider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
return Scaffold(

);
  }

}