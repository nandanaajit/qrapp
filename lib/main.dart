import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),

        body:Container(color: Colors.cyan, child:  Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('login',style: TextStyle(fontSize: 30)),
              SizedBox( width: 200,child: TextField(
                decoration: InputDecoration(
                  labelText: 'enter your email',
                ),
              ) ,
              ),

              SizedBox(width:200 ,child: TextField(
                decoration: InputDecoration(
                  labelText: 'enter your password',
                ),
              ) ),

              SizedBox(),
              ElevatedButton(onPressed: () {},
                  child: Text('login')),
            ],
          ),
        ),
    ),
    ));
  }
}







