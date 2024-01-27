import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:omc/provider/indexprovider.dart';

class adsearch extends ConsumerStatefulWidget {
  adsearch({Key? key}) : super(key: key);
  @override
  _adsearchState createState() => _adsearchState();
}
class _adsearchState extends ConsumerState<adsearch>{
  late final WebViewController controller;
  late List list1 = ["OMC22(A)"];
  late List list2 = ["https://onlinemathcontest.com/contests/omc194/tasks/2351"];
  late Map list3 = {"OMC1" : "https://onlinemathcontest.com/omc20/"};
  void _menu(){
  }
  void vert(){
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  webview(){
    final _password = ref.read(password);
    final _username = ref.read(username);

    return WebView(
      initialUrl: "https://onlinemathcontest.com/login/",
      javascriptMode: JavascriptMode.unrestricted,
      gestureNavigationEnabled: true,
      onWebViewCreated: (controller) {
        this.controller = controller;
      },
      onPageFinished: (url) async {
        if (url == 'https://onlinemathcontest.com/login/'
            && ref.watch(autoLogin) == true) {
          Future.delayed(Duration(milliseconds: 50), () {
            controller.runJavascript(
                "document.getElementById('password').value='" + _password + "';"
                    "document.getElementById('display_name').value='" +
                    _username + "';");
          },
          );
          Future.delayed(Duration(milliseconds: 100), () {
            controller.runJavascript(
                "document.querySelector('div div button').click();");
            controller.loadUrl('https://onlinemathcontest.com/problems/');
          },
          );
        }
        if (url == 'https://onlinemathcontest.com/problems/') {
          Future.delayed(Duration(milliseconds: 100), () {
            list1.add(controller.runJavascriptReturningResult(""
                "list = document.querySelectorAll('td > a > span');"
                "list.forEach((element)=>{console.log(element.innerHTML)});")
            );
            list2.add(
                controller.runJavascriptReturningResult(""
                    "list = document.querySelectorAll('td > a');"
                    "list.forEach((element)=>{console.log(element.href)});")
            );
            list1.forEach((element){
              list3[element] = list2[list1.indexOf(element)];
            });
          }
          );
        }
      }
    );
  }
  @override
  Widget build(BuildContext context){
    final bookmark = ref.watch<Map<String, String>>(bookmarkProvider);
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
            IconButton(
                onPressed: () async {
                  String? url = await controller.currentUrl();
                  String? title = await controller.runJavascriptReturningResult("document.getElementById('problem-title').innerHTML;");
                  if (url != null) {

                    bookmark[title] = url;
                  }
                },
                icon: Icon(Icons.bookmark_add_outlined))
          ],
        ),
      body: Center(
          child: ListView.builder(
              itemCount: list3.length,
              itemBuilder: (context, index) {
                var key = list3.keys.elementAt(index);
                return InkWell(
                  onTap: (){
                    ref.read(urlprovider.notifier).state = '${list3[key]}';
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
                            subtitle: Text('${list3[key]}'),
                          ),
                        ]
                    ),
                  ),
                );
              }
          )
      ),
    );

  }
}