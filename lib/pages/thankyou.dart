import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/actionmenu.dart';

class ThankYou extends StatelessWidget {

  final String name;
  ThankYou({required this.name}){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank You ${name}"),
        actions: actionMenu(context),
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
