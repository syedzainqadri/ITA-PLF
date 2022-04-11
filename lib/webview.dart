import 'dart:io';

import 'package:PLF/utils/ColorScheme.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String title, url;
  const WebViewPage({Key key, @required this.title, @required this.url})
      : super(key: key);
  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: darkBlue,
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
