import 'package:todo_project/GetAllTodo/Models/gettodomodel.dart';

abstract class GetTodoStates {}

class GetTodoInitialStates extends GetTodoStates {}

class GetTodoLoadingStates extends GetTodoStates {}

class GetTodoLoadedStates extends GetTodoStates {
  GetAllTodoModel getAllTodoModel;
  GetTodoLoadedStates({required this.getAllTodoModel});
}

class GetTodoErrorStates extends GetTodoStates {
  String error;
  GetTodoErrorStates({required this.error});
}
