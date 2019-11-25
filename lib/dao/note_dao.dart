import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_pocket_space/dao/dao.dart';
import 'package:my_pocket_space/repositories/hasura.dart';

part 'note_dao.g.dart';

@UseDao(
  tables: [Note],
  queries: {'deleteWhereIn': 'DELETE * FROM note WHERE id IN();'},
)
class NoteDao extends DatabaseAccessor<MyDatabase> with _$NoteDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  NoteDao(MyDatabase db) : super(db);

  Stream<List<NoteData>> notes() {
    return (select(note)).watch();
  }

  Future<void> insert(NoteCreateDto dto) async {
    try {
      final data = NoteCompanion.insert(title: dto.title, content: dto.content);
      await into(note).insert(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> change(NoteUpdateDto dto) async {
    try {
      final data = NoteCompanion.insert(
        title: dto.title,
        content: dto.content,
        updatedAt: Value(dto.updatedAt),
      );
      await (update(note)..where((note) => note.id.equals(dto.id))).write(
        data,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remove(List<int> ids) async {
    try {
      ids.forEach((noteItem) {
        (delete(note)..where((e) => e.id.equals(noteItem))).go();
      });
    } catch (e) {}
  }
}
