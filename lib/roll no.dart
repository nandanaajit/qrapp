import 'package:flutter/material.dart';

class Rollno extends StatefulWidget {
  const Rollno({Key? key}) : super(key: key);

  @override
  State<Rollno> createState() => _RollnoState();
}

class _RollnoState extends State<Rollno> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1)),
                        foregroundColor: Colors.white,
                        padding:
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),

                      ))
                ],
              ),
            ),
        ),
    );
  }
}
