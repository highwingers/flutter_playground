import 'package:flutter/material.dart';
import 'package:flutter_playground/auth/auth_service.dart';
import 'package:flutter_playground/pages/home.dart';
class Google extends StatefulWidget {
  const Google({super.key});

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
 String? _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Signin"
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () async {
            AuthService auth = AuthService();
            await auth.signInWithGoogle();

            if(auth.getCurrentUser()?.email!=null) {
              print(auth.getCurrentUser()?.uid);
              Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
            }


            setState(() {
              _email = auth.getCurrentUser()?.email.toString();
            });

          },   child: Text("Google Sign-in")),
          Text(_email??"Email"),
        ],
      )
    );
  }
}
