import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/Add_task.dart';
import 'package:todo_project/SignIn/Cubits/signincubits.dart';
import 'package:todo_project/SignIn/Cubits/signinstates.dart';
import 'package:todo_project/SignUp.dart';
import 'package:todo_project/uiHelper.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<Signincubits, Signinstates>(
      listener: (context, state) {
        if (state is SignInSuccessStates) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddTask()));
          log(state.signInModel.data!.email.toString());
        } else if (state is SignInErrorStates) {
          Center(
            child: Text(state.error.toString()),
          );
        }
      },
      builder: (context, state) {
        if (state is SignInLoadingStates) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Center(child: Image.asset("assets/images/login1.jpg",height: 270,width: 300,)),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Text("Welcome Back!",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                  ),
                ),
                Center(
                    child: Text("Please enter login details below",
                        style: TextStyle(fontSize: 15))),
                SizedBox(
                  height: 120,
                ),
                Uihelper.CustomTextField(
                    emailController, 'User@gmail.com', Icons.mail, false, ''),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  child: Uihelper.CustomPassword(passwordController,
                      'Enter password', "Password", isPassVisible, () {
                    setState(() {
                      isPassVisible = !isPassVisible;
                      log(isPassVisible.toString());
                    });
                  }),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 230.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Uihelper.CustomButton(() {
                  Signin(emailController.text.toString(),
                      passwordController.text.toString());
                }, 'Sign In'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
                        },
                        child: Text("Sign Up"),
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.deepPurple,
                            textStyle: TextStyle(
                                decoration: TextDecoration.underline)))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  Signin(String email, String password) {
    if (email == "" || password == "") {
      return Uihelper.CustomAlertBox(context, "Enter Required Field's");
    } else {
      context.read<Signincubits>().signin(email, password);
      log("Data Added");
    }
  }
}
