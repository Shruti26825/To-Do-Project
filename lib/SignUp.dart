import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/SignIn.dart';
import 'package:todo_project/SignUp/Cubits/signupcubit.dart';
import 'package:todo_project/SignUp/Cubits/signupstates.dart';
import 'package:todo_project/uiHelper.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPassVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessStates) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Signin()));
         // log(state.signUpModel.data!.username.toString());
        } else if (state is SignUpErrorStates) {
          Center(
            child: Text(state.error.toString()),
          );
        }
      },
      builder: (context, state) {
        if (state is SignUpLoadingStates) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Center(child: Image.asset("assets/images/signup3.jpg",height: 200,width: 320,)),
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                        child: Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: Center(
                      child: Text(
                          "Fill your information below",
                          style: TextStyle(fontSize: 15))),
                ),
                SizedBox(
                  height: 60,
                ),
                Uihelper.CustomTextField(nameController, 'Enter your name',
                    Icons.account_circle, false, ''),
                SizedBox(
                  height: 40,
                ),
                Uihelper.CustomTextField(
                    emailController, 'User@gmail.com', Icons.mail, false, ''),
                SizedBox(
                  height: 40,
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

                SizedBox(
                  height: 70,
                ),
                Uihelper.CustomButton(() {
                  Signup(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                      nameController.text.toString(),
                      context);
                }, "Sign Up"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signin()));
                        },
                        child: Text("Sign In"),
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

  Signup(String email, String password, String username, BuildContext context) {
    if (email == "" || password == "" || username == "") {
      return log("Enter Required field's");
    } else {
      context.read<SignUpCubit>().signup(email, password, username);
    }
  }
}
