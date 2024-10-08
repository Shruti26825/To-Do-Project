import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_project/AddTask/Cubits/addcubits.dart';
import 'package:todo_project/GetAllTodo/Cubits/gettodocubit.dart';
import 'package:todo_project/SignIn/Cubits/signincubits.dart';
import 'package:todo_project/SignUp/Cubits/signupcubit.dart';
import 'package:todo_project/Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>SignUpCubit()),
        BlocProvider(create: (context)=>Signincubits()),
        BlocProvider(create: (context)=>AddtodoCubit()),
        BlocProvider(create: (_)=>GetTodoCubit()..getTodo())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: SplashScreen(),
          //home: AddTask(),
      ),
    );
  }
}