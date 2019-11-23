class Note {
  int id;
  String title;
  String content;
  DateTime createdAt;
  String updatedAt;

  Note({this.id, this.title, this.content, this.createdAt, this.updatedAt});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['note_id'];
    title = json['note_title'];
    content = json['note_content'];
    createdAt = DateTime.parse(json['note_created_at']);
    updatedAt = json['note_daupted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['note_id'] = this.id;
    data['note_title'] = this.title;
    data['note_content'] = this.content;
    data['note_created_at'] = this.createdAt;
    data['note_updated_at'] = this.updatedAt;
    return data;
  }
}
