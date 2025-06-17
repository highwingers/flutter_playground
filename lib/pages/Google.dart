import 'package:flutter/material.dart';
import 'package:flutter_playground/auth/auth_service.dart';
import 'package:flutter_playground/pages/home.dart';

class Google extends StatefulWidget {
  const Google({super.key});

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  String? _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Signin")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () async {
                  AuthService auth = AuthService();

                  // Sign in with Google
                  var result = await auth.GoogleSignInWithoutFireBase();

                  setState(() {
                    _email = result?.email;
                  });

                  /*                   await auth.signInWithGoogle();

                  if (auth.getCurrentUser()?.email != null) {
                    print(auth.getCurrentUser()?.uid);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Home()),
                    );
                    setState(() {
                      _email = auth.getCurrentUser()?.email.toString();
                    });
                  } */
                },
                child: Text("Google Sign-in"),
              ),
              Text(_email ?? "No user signed in"),
            ],
          ),
        ),
      ),
    );
  }
}
