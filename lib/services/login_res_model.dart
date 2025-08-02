class LoginResModel {
  String? username;
  String? password; 

  LoginResModel({this.username, this.password});
  LoginResModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
  
  

}