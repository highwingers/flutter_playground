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
    );
  }
}
