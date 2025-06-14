import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/auth/auth_service.dart';
import 'package:flutter_playground/pages/home.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Apple extends StatefulWidget {
  const Apple({super.key});

  @override
  State<Apple> createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apple Sign in')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SignInWithAppleButton(
                onPressed: () async {
                  await AuthService().signInWithApple();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
