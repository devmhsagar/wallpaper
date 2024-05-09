import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededeb),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
        padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(MediaQuery.of(context).size.width, 110),
            )),
      ),
    );
  }
}
