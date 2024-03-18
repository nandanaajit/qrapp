import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:login_ui_flutter/qr_screen.dart';
import 'package:login_ui_flutter/register_screen.dart';
import 'package:http/http.dart'as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController rollno = TextEditingController();
      TextEditingController password=  TextEditingController();


  Future<void> login() async {
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/login');
    var response = await http.post(uri,
      headers: <String, String>{
        'content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode({
      'rollno': rollno.text,
      'password': password.text,

      })
    );
    var data=jsonDecode(response.body);
    print(data["message"]);
    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> QrScreen(),));
    }

    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                    controller: rollno,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        hintText: "Enter Your Roll No",
                        hintStyle: const TextStyle(color: Colors.white70),
                        contentPadding: const  EdgeInsetsDirectional.all(19.0)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const  BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      hintText: "Enter Your Password",
                      hintStyle: const TextStyle(color: Colors.white70),
                      contentPadding: const EdgeInsetsDirectional.all(19.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.white70, width: 1)),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    login();
                   // Navigator.push(context,
                       // MaterialPageRoute(builder: (context) => const QrScreen()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: const Text(
                      "Don't have an account? Register",
                      style: TextStyle(color: Colors.white70),
                    ))
              ],
            )),
      ),
    );
  }
}
