import 'package:flutter/material.dart';
import 'package:flutter_playground/auth/auth_service.dart';
import 'package:flutter_playground/pages/home.dart';
import 'package:flutter_playground/pages/location.dart';
import 'package:flutter_playground/pages/Google.dart';

import 'package:flutter_playground/pages/apple.dart';



List<Widget> actionMenu(BuildContext context) {
  return   [
    PopupMenuButton<String>(
    onSelected: (value) async {
      // Handle menu actions
      if(value=='location') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Location()));
      }
      if(value=='home') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }

      if(value=='google') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Google()));
      }
      if(value=='apple') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Apple()));
      }
      if(value=='logout') {
        await AuthService().logOut();
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    },
    itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(value: 'home', child: Text('Home')),
        PopupMenuItem(value: 'location', child: Text('Location')),
        PopupMenuItem(value: 'google', child: Text('Google')),
        PopupMenuItem(value: 'apple', child: Text('Apple')),
        PopupMenuItem(value: 'logout', child: Text('Logout')),
      ];
    },
  )
  ];
}