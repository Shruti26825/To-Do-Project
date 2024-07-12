abstract class SignUpevents{}
class SignUpUserEvents extends SignUpevents{
  String email;
  String password;
  String username;
  SignUpUserEvents({required this.email,required this.password,required this.username});
}