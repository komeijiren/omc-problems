import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:omc/provider/indexprovider.dart';

class search extends ConsumerStatefulWidget {
  search({Key? key}) : super(key: key);
  @override
  _searchState createState() => _searchState();
}
class _searchState extends ConsumerState<search>{
  late final WebViewController controller;
  void _menu(){

  }
  void vert(){

  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    final bookmark = ref.watch<Map<String, String>>(bookmarkProvider);
    final _urlprovider = ref.read(urlprovider.notifier);
    final _username = ref.read(username);
    final _password = ref.read(password);
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
      body: SafeArea(
        child: WebView(
          initialUrl: "https://onlinemathcontest.com/login/",
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          onWebViewCreated: (WebViewController webViewController){
            controller = webViewController;
          },
          onPageFinished: (url) {
            if(url == 'https://onlinemathcontest.com/login/'
            && ref.watch(autoLogin) == true){
              Future.delayed(Duration(milliseconds: 50), () {
                controller.runJavascript(
                    "document.getElementById('password').value='" + _password + "';"
                        "document.getElementById('display_name').value='" + _username + "';");
              },
              );
              Future.delayed(Duration(milliseconds: 100), () {
            controller.runJavascript("document.querySelector('div div button').click();");
            },
              );
          }
            Future.delayed(Duration(milliseconds: 100), ()
            {
              if (url != 'https://onlinemathcontest.com/problems'
                  && url != 'https://onlinemathcontest.com/problems/'
                  && !url.contains('omc')
                  && url != 'https://onlinemathcontest.com/'
                  && url != 'https://onlinemathcontest.com/login/'){
                print(url);

                controller.loadUrl(_urlprovider.state);
              }
            });
            if(url == 'https://onlinemathcontest.com/'){
              if(_urlprovider.state != 'https://onlinemathcontest.com/login/') {
                controller.loadUrl(_urlprovider.state);
              }
              else{
                controller.loadUrl('https://onlinemathcontest.com/problems/');
              }

            }
          },
        ),
      )

    );

}
}