class GetAllTodoModel {
  String? message;
  List<Data>? data;

  GetAllTodoModel({this.message, this.data});

  GetAllTodoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? todo;
  String? createdat;
  String? user;
  bool? check;
  int? iV;

  Data({this.sId, this.todo, this.createdat, this.user, this.check, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    todo = json['todo'];
    createdat = json['createdat'];
    user = json['user'];
    check = json['check'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['todo'] = this.todo;
    data['createdat'] = this.createdat;
    data['user'] = this.user;
    data['check'] = this.check;
    data['__v'] = this.iV;
    return data;
  }
}
