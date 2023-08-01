import 'package:flutter/material.dart';
import 'package:trash_picker/Pages/OnAppStart/sign_up_page.dart';
import 'package:trash_picker/Pages/OnAppStart/welcome_page.dart';

import 'package:webview_flutter/webview_flutter.dart' as webview_flutter;

class UserGuidePage extends StatefulWidget {
  @override
  _UserGuidePageState createState() => _UserGuidePageState();
}

class _UserGuidePageState extends State<UserGuidePage> {
  final _key = UniqueKey();
  bool isLoading = true;
  String siteLink =
      "https://sites.google.com/view/trashpick--app-user-guide/home";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          print("test");
           Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
         return WelcomePage();
       }));
    return true;
          
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).iconTheme.color),
              onPressed: () {
                print("Go to Welcome Page");
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            title: Text(
              "User Guide",
              style: Theme.of(context).textTheme.headline6,
            ),
            elevation: Theme.of(context).appBarTheme.elevation,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: TextButton(
                  child: Text(
                    "Continue to Sign Up",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                      (Route<dynamic> route) => false,
                    );
                    print("Switch to Sign Up");
                  },
                ),
              )
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: [
                // WebView(
                //   key: _key,
                //   initialUrl: siteLink,
                //   javascriptMode: JavascriptMode.unrestricted,
                //   onPageFinished: (finish) {
                //     setState(() {
                //       isLoading = false;
                //     });
                //   },
                // ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(),
              ],
            ),
          ),
        ));
  }
}
