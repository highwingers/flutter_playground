import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/auth/auth_service.dart';
import 'package:flutter_playground/pages/amazon.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_playground/pages/thankyou.dart';
import 'package:flutter_playground/pages/actionmenu.dart';
import 'package:app_links/app_links.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _txtName = TextEditingController();
  bool _isLoading = false;

  late final StreamSubscription<Uri> _sub;
  @override
  void initState() {
    super.initState();

    // Handle link when app is launched via deep link (cold start)
    AppLinks().getInitialLink().then((uri) {
      if (uri != null) {
        print("11111111111111111111111");
      }
    });

    _sub = AppLinks().uriLinkStream.listen((uri) {
      // e.g. myapp://open?foo=bar&baz=qux

      print('Incoming link: ${uri.toString()}');

      if (uri.host == 'open') {
        final String foo = uri.queryParameters['foo'] ?? "";
        final baz = uri.queryParameters['baz'];
        final email = uri.queryParameters['email'];

        if (foo == 'amazon') {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Amazon(foo: foo, email: email),
              ),
            );
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: Container(),
        title: AuthService().getCurrentUser()?.uid == null
            ? Text("Dart Playground")
            : Text(AuthService().getCurrentUser()?.uid ?? ""),
        actions: actionMenu(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _txtName,
              decoration: InputDecoration(
                hint: Text("Enter Name"),
                suffixIcon: IconButton(
                  onPressed: () {
                    print(_txtName.text);
                    _txtName.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_txtName.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter your name'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                setState(() {
                  _isLoading = true;
                });

                await Future.delayed(Duration(seconds: 3)); // ⏱ 3-second delay

                final url = Uri.parse(
                  'https://webhook.site/f115a122-c546-4a84-87e9-227dc4cc3931',
                );
                await http.post(url, body: {'txtNAme': _txtName.text});

                setState(() {
                  _isLoading = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThankYou(name: _txtName.text),
                  ),
                );
              },
              child: Text("Submit"),
            ),
            if (_isLoading)
              CircularProgressIndicator(padding: EdgeInsetsGeometry.all(15)),
          ],
        ),
      ),
    );
  }
}
