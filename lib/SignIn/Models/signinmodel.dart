class SignInModel {
  String? message;
  String? mail;
  Data? data;
  String? token;

  SignInModel({this.message, this.mail, this.data, this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    mail = json['mail'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['mail'] = this.mail;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? password;
  String? username;
  int? iV;

  Data({this.sId, this.email, this.password, this.username, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['__v'] = this.iV;
    return data;
  }
}
