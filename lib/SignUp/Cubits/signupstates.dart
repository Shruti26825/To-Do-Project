import 'package:todo_project/SignUp/Models/signupmodel.dart';

abstract class SignUpStates{}
class SignUpInitialStates extends SignUpStates{}
class SignUpLoadingStates extends SignUpStates{}
class SignUpSuccessStates extends SignUpStates{
  SignUpModel signUpModel;
  SignUpSuccessStates({required this.signUpModel});
}
class SignUpErrorStates extends SignUpStates{
  String error;
  SignUpErrorStates({required this.error});
}