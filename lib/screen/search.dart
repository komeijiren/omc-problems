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
    return Scaffold(

        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('OMCの問題集'),
        leading: IconButton(
            onPressed: _menu,
            icon: Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(
              onPressed: vert,
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
           // if(url == 'https://onlinemathcontest.com/login/') {
           //   Future.delayed(Duration(seconds: 3), () {
           //     controller.runJavascript(
           //         "document.getElementById('password').value='';"
           //             "document.getElementById('display_name').value='';"
            //            "document.querySelector('div div button').click();");
            //    controller.loadUrl(_urlprovider.state);
            //  });
            //}
            Future.delayed(Duration(seconds: 5), ()
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