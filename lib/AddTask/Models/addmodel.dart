class AddTaskModel {
  String? message;
  Response? response;

  AddTaskModel({this.message, this.response});

  AddTaskModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? todo;
  String? createdat;
  String? user;
  bool? check;
  String? sId;
  int? iV;

  Response(
      {this.todo, this.createdat, this.user, this.check, this.sId, this.iV});

  Response.fromJson(Map<String, dynamic> json) {
    todo = json['todo'];
    createdat = json['createdat'];
    user = json['user'];
    check = json['check'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todo'] = this.todo;
    data['createdat'] = this.createdat;
    data['user'] = this.user;
    data['check'] = this.check;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
