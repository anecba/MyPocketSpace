
class NoteUpdateDto {
  final int id;
  final String title;
  final String content;
  final DateTime updatedAt;

  NoteUpdateDto(this.title, this.content, this.id, this.updatedAt);
}

class NoteCreateDto {
  final String title;
  final String content;
  NoteCreateDto(this.title, this.content);
}

