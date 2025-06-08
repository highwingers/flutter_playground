import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_playground/pages/thankyou.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _txtName = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text("Dart Playground"),
      ) ,
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
            TextField(
              controller: _txtName,
              decoration: InputDecoration(

                hint: Text("Enter Name"),
                suffixIcon: IconButton(onPressed: () {
                    print(_txtName.text);
                    _txtName.clear();
                }, icon: Icon(Icons.clear))
              ),
            ),
           SizedBox(height: 10),
           ElevatedButton(onPressed:  () async {


             if(_txtName.text.isEmpty){
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text('Please enter your name'),
                   backgroundColor: Colors.red,
                 ),
               );
               return;
             }

             setState(() {
               _isLoading=true;
             });

             await Future.delayed(Duration(seconds: 3)); // ⏱ 3-second delay

             final url = Uri.parse('https://webhook.site/f115a122-c546-4a84-87e9-227dc4cc3931');
             await http.post(url, body: {'txtNAme': _txtName.text});

             setState(() {
               _isLoading=false;
             });
              Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => ThankYou(name: _txtName.text)
               ),
              );
           }, child: Text("Submit")),
           if(_isLoading) CircularProgressIndicator(
             padding: EdgeInsetsGeometry.all(15) ,
           ),
         ],
       ),
     ),
    );
  }
}
