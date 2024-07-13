import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/AddTask/Cubits/addcubits.dart';
import 'package:todo_project/GetAllTodo/Cubits/gettodocubit.dart';
import 'package:todo_project/GetAllTodo/Cubits/gettodostates.dart';
import 'package:todo_project/uiHelper.dart';

class AddTask extends StatelessWidget {
  TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Todo App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<GetTodoCubit, GetTodoStates>(builder: (context, state) {
        if (state is GetTodoLoadingStates) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetTodoLoadedStates) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${index + 1}"),
                title: Text(state.getAllTodoModel.data![index].todo.toString()),
                subtitle: Text(state.getAllTodoModel.data![index].createdat.toString()),
              );
            },
            itemCount: state.getAllTodoModel.data!.length,
          );
        } else if (state is GetTodoErrorStates) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return Center(
          child: Text("Data Not Found!!"),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add Todo"),
                    content: Uihelper.CustomTextField(
                        todoController, "Enter a Todo", Icons.today_outlined, false, "*"),
                    actions: [
                      TextButton(
                          onPressed: () {
                                 context.read<AddtodoCubit>().addtodo(todoController.text.toString());
                                 Navigator.pop(context);
                                 context.read<GetTodoCubit>().getTodo();
                          },
                          child: Text("Add Todo"))
                    ],
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
