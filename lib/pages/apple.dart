import 'package:flutter/material.dart';
class Apple extends StatefulWidget {
  const Apple({super.key});

  @override
  State<Apple> createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: () {

                }, child: Text('Apple Login'))
              ],
            ),
          ),
        )
      ),
    );
  }
}
