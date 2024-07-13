import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_project/GetAllTodo/Cubits/gettodostates.dart';
import 'package:http/http.dart' as http;
import 'package:todo_project/GetAllTodo/Models/gettodomodel.dart';
class GetTodoCubit extends Cubit<GetTodoStates>{
  GetTodoCubit():super(GetTodoInitialStates());
  getTodo()async{
    emit(GetTodoLoadingStates());
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? token=prefs.getString("token");
    String? userid=prefs.getString("userid");
    final response=await http.post(Uri.parse("https://todo-ap-is.vercel.app/todoapp/getalltodos"),
    headers: {
      "Content-Type":'application/json',
      'Authorization':token!
    },
      body: jsonEncode({
        "user":userid
      })

    );
    if(response.statusCode==200){
      Map<String,dynamic>responsedata=jsonDecode(response.body);
      GetAllTodoModel getAllTodoModel=GetAllTodoModel.fromJson(responsedata);
      emit(GetTodoLoadedStates(getAllTodoModel: getAllTodoModel));
    }
    else{
      emit(GetTodoErrorStates(error: response.statusCode.toString()));
    }
  }
}