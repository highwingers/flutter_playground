import 'package:flutter/material.dart';
class Amazon extends StatefulWidget {
  const Amazon({super.key});

  @override
  State<Amazon> createState() => _AmazonState();
}

class _AmazonState extends State<Amazon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {


          }, child: Text('Amazon'))
        ],
      ),
    );
  }
}
