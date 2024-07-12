abstract class Signinevents{}
class SignInUserEvents extends Signinevents{
  String email;
  String password;
  SignInUserEvents({required this.email,required this.password});
}
