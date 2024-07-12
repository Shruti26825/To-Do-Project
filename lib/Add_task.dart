import 'package:flutter/material.dart';
import 'package:todo_project/uiHelper.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900)),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 20,
                child: Row(
                  children: [
                    Expanded(
                        flex: 70,
                        child: Container(padding: EdgeInsets.only(top: 700,left: 170,right: 170,bottom: 10),
                            child: FloatingActionButton(
                              child: Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.blueAccent,
                              ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              onPressed: ()=>{
                                showDialog(context: context, builder: (context){
                                  return Dialog(
                                    backgroundColor: Colors.white60,
                                    child: SizedBox(
                                      height: 500,
                                      width: 500,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                               Text("Add Task"),
                                            GestureDetector(
                                              onTap: ()=>Navigator.of(context).pop(),
                                              child: Icon(Icons.close),
                                            ),
                                          ],
                                        ),

                                      ),
                                    ),);
                                })
                              },
                            ),
                          ),
                        ),

                  ],
                )
            )
           ],
         ),
        ),

    );
  }
}
