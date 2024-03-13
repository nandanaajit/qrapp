import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width:400,child: TextField(
                decoration: InputDecoration(
                  labelText: 'enter your name'
                ),
              ),),
              SizedBox(width: 200,child: TextField(
                decoration: InputDecoration(
                  labelText:'enter your roll no',
                )
              ),),
              SizedBox(width: 200,child: TextField(
                decoration: InputDecoration(
                  labelText: 'enter your email',

                ),
              ),),
              SizedBox(width: 200,child: TextField(
                decoration: InputDecoration(
                  labelText: 'enter your password',
                ),
              ),),
              SizedBox(),
              ElevatedButton(onPressed: (){},
                  child: Text('REGISTER')),
            ],
          ),

        ),
      ),
    );
  }
}
