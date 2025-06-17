import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class Amazon extends StatefulWidget {
  final String? foo;
  String? email; // Optional email parameter, if needed.
  // This is just a placeholder for the foo parameter.

  Amazon({this.foo, this.email, Key? key}) : super(key: key) {
    print('I got the value $email');
  }

  @override
  State<Amazon> createState() => _AmazonState();
}

class _AmazonState extends State<Amazon> {
  void initState() {
    super.initState();
    // You can perform any initialization here if needed.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amazon')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final clientId =
                          'amzn1.application-oa2-client.48a0a930a4c1487292794602426a1935';
                      final redirectUrl =
                          'https://smartazan.saqibkhan.com/alexa/api/AmazonLwa/mobile-sign-in-response';

                      final authUrl =
                          'https://www.amazon.com/ap/oa?client_id=$clientId&scope=profile&response_type=code&redirect_uri=$redirectUrl';

                      final result = await FlutterWebAuth2.authenticate(
                        url: authUrl,
                        callbackUrlScheme:
                            'https', // Important to match your backend scheme
                      );
                    },
                    child: Text('Amazon'),
                  ),
                ),
              ),
            ],
          ),
          Text(widget.email ?? 'No email provided'),
        ],
      ),
    );
  }
}
