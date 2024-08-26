import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/SignUp/Cubits/signupevents.dart';
import 'package:todo_project/SignUp/Cubits/signupstates.dart';
import 'package:http/http.dart' as http;
import 'package:todo_project/SignUp/Models/signupmodel.dart';
import 'package:todo_project/Utils/BaseUrls.dart';
class SignUpCubit extends Bloc<SignUpevents,SignUpStates> {
  SignUpCubit() :super(SignUpInitialStates());
  
  signup(String email,String password,String username)async{
    emit(SignUpLoadingStates());
    final response=await http.post(Uri.parse(Baseurls.signup),
    headers: {
      "Content-Type":'application/json'
    },
      body: jsonEncode({
        "email":email,
        "password":password,
        "username":username
      })
    );
    if(response.statusCode==200){
      Map<String,dynamic>responsedata=jsonDecode(response.body);
      SignUpModel signUpModel=SignUpModel.fromJson(responsedata);
      emit(SignUpSuccessStates(signUpModel: signUpModel));
    }
    else{
      emit(SignUpErrorStates(error: response.statusCode.toString()));
    }
  }
}