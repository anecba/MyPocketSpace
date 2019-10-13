class User {
  int id;
  String name;
  String email;

  User({this.id, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['user_id'];
    name = json['user_name'];
    email = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.id;
    data['user_name'] = this.name;
    data['user_email'] = this.email;
    return data;
  }
}
