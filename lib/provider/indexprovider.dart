import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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