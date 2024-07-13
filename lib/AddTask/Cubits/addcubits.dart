import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_project/AddTask/Cubits/addstates.dart';
import 'package:http/http.dart' as http;
import 'package:todo_project/AddTask/Models/addmodel.dart';
import 'addevents.dart';

class AddtodoCubit extends Bloc<Addevents, AddTodoStates> {
  AddtodoCubit() : super(AddTodoInitialStates());

  addtodo(String todo) async {
    emit(AddTodoLoadingStates());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? userid = prefs.getString("userid");
    final response = await http.post(
        Uri.parse("https://todo-ap-is.vercel.app/todoapp/addalltodo"),
        headers: {'Content-Type': 'application/json', 'Authorization': token!},
        body: jsonEncode({"user": userid, "todo": todo}));
    if (response.statusCode == 200) {
      Map<String, dynamic> responsedata = jsonDecode(response.body);
      AddTaskModel addTaskModel = AddTaskModel.fromJson(responsedata);
      log(responsedata.toString());
      emit(AddTodoLoadedStates(addTaskModel: addTaskModel));
    } else {
      emit(AddTodoErrorStates(error: response.statusCode.toString()));
    }
  }
}
