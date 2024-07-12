import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_project/SignIn/Cubits/signinevents.dart';
import 'package:todo_project/SignIn/Cubits/signinstates.dart';
import 'package:http/http.dart' as http;
import 'package:todo_project/SignIn/Models/signinmodel.dart';

class Signincubits extends Bloc<Signinevents, Signinstates> {
  Signincubits() : super(SignInInitialStates());

  signin(String email, String password) async {
    emit(SignInLoadingStates());
    SharedPreferences prefs=await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse("https://todo-ap-is.vercel.app/todoapp/signin"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));
    if (response.statusCode == 200) {
      Map<String, dynamic> responsedata = jsonDecode(response.body);
      String token=responsedata['token'];
      String userid=responsedata['data']['_id'];
      log(token);
      log(userid);
      prefs.setString("token", token);
      prefs.setString("userid", userid);
      prefs.setBool("islogin", true);
      SignInModel signInModel = SignInModel.fromJson(responsedata);
      emit(SignInSuccessStates(signInModel: signInModel));
    } else {
      log(response.statusCode.toString());
      emit(SignInErrorStates(error: response.statusCode.toString()));
    }
  }
}
