import 'package:todo_project/AddTask/Models/addmodel.dart';

abstract class AddTodoStates{}
class AddTodoInitialStates extends AddTodoStates{}
class AddTodoLoadingStates extends AddTodoStates{}
class AddTodoLoadedStates extends AddTodoStates{
  AddTaskModel addTaskModel;
  AddTodoLoadedStates({required this.addTaskModel});
}
class AddTodoErrorStates extends AddTodoStates{
  String error;
  AddTodoErrorStates({required this.error});
}