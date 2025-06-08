import 'package:flutter/material.dart';
class ThankYou extends StatelessWidget {

  final String name;
  ThankYou({required this.name}){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank You ${name}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Thank you $name .")
          ]
        ),
      ),
    );
  }
}
