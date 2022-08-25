class UserModel {
  String? type;
  String? message;
  Data? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? refreshToken;

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   if (this.user != null) {
  //     data['user'] = this.user!.toJson();
  //   }
  //   data['accessToken'] = this.accessToken;
  //   data['refreshToken'] = this.refreshToken;
  //   return data;
  // }

}

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  var address;
  String? role;

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}
