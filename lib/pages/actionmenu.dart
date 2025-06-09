import 'package:flutter/material.dart';
import 'package:flutter_playground/pages/home.dart';
import 'package:flutter_playground/pages/location.dart';



List<Widget> actionMenu(BuildContext context) {
  return   [
    PopupMenuButton<String>(
    onSelected: (value) {
      // Handle menu actions
      if(value=='location') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Location()));
      }
      if(value=='home') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    },
    itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(value: 'home', child: Text('Home')),
        PopupMenuItem(value: 'location', child: Text('Location')),
        PopupMenuItem(value: 'logout', child: Text('Logout')),
      ];
    },
  )
  ];
}