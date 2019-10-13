class Tag {
  int id;
  String name;

  Tag({this.id, this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['tag_id'];
    name = json['tag_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag_id'] = this.id;
    data['tag_name'] = this.name;
    return data;
  }
}
