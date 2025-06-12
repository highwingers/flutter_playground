import 'package:flutter/material.dart';

class Amazon extends StatefulWidget {
  final String? foo;
  // This is just a placeholder for the foo parameter.

  Amazon({this.foo, Key? key}) : super(key: key) {
    print('I got the value $foo');
  }

  @override
  State<Amazon> createState() => _AmazonState();
}

class _AmazonState extends State<Amazon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amazon')),
      body: Column(
        children: [ElevatedButton(onPressed: () {}, child: Text('Amazon'))],
      ),
    );
  }
}
