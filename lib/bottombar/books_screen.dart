


import 'package:flutter/material.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Buy Book"),),
    );
  }
}
