import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_project/Add_task.dart';
import 'package:todo_project/SignIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? checkuser = prefs.getBool("islogin");
      if (checkuser != null) {
        if (checkuser) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) =>  AddTask()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Signin()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Signin()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/images/todo_logo.png"),
            )
          ],
        ),
      ),
    );
  }
}
