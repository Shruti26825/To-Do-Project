import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/AddTask/Cubits/addcubits.dart';
import 'package:todo_project/uiHelper.dart';

class AddTodoController{
  static addtodo(String todo,BuildContext context){
    if(todo==""){
      return Uihelper.CustomAlertBox(context, "Enter a Todo");
    }
    else{
      context.read<AddtodoCubit>().addtodo(todo);
      log("Success");
    }
  }
}