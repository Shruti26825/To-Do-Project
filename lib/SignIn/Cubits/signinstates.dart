import 'package:todo_project/SignIn/Models/signinmodel.dart';

abstract class Signinstates{}
class SignInInitialStates extends Signinstates{}
class SignInLoadingStates extends Signinstates{}
class SignInSuccessStates extends Signinstates{
  SignInModel signInModel;
  SignInSuccessStates({required this.signInModel});
}
class SignInErrorStates extends Signinstates{
  String error;
  SignInErrorStates ({required this.error});
}