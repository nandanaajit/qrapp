import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_ui_flutter/login_screen.dart';
import 'package:http/http.dart'as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void register()async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/register');
    var response = await http.post(uri,
        headers: <String, String>{
          'context-type': 'application/json;charset=UTF-8',
        },
        body: jsonEncode({
          'name': name.text,
          'email': email.text,
          'rollno': rollno.text,
          'password': password.text,
        }));
    print(response.statusCode);
    print(response.body);

    var data=jsonDecode(response.body);
    print(data["message"]);
    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(),));
    }

   else {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Registration",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputText(hinttext: 'Enter your Name', controller: name),
            InputText(hinttext: 'Enter your roll no', controller: rollno),
            InputText(hinttext: 'Enter your Email', controller: email),
            InputText(hinttext: 'Enter your Password', controller: password),
            const SizedBox(
              height: 30,
            ),

            TextButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1)),
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onPressed: () {

                String enteredName = name.text;
                String enteredRollNo = rollno.text;
                String enteredEmail = email.text;
                String enteredPassword = password.text;


                print('Name: $enteredName');
                print('Roll No: $enteredRollNo');
                print('Email: $enteredEmail');
                print('Password: $enteredPassword');


                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: const Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.hinttext,
    required this.controller,
  }) : super(key: key);

  final String hinttext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.white70),
          contentPadding: const EdgeInsetsDirectional.all(19.0),
        ),
      ),
    );
  }
}
