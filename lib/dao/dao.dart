import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_pocket_space/dao/note_dao.dart';
import 'package:my_pocket_space/dao/note_tag_dao.dart';
import 'package:my_pocket_space/dao/tag_dao.dart';

part 'dao.g.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1)();
  TextColumn get content => text().withLength(min: 1)();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class NoteTag extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get noteId => integer()();
  IntColumn get tagId => integer()();
}

class Tag extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
}

@UseMoor(tables: [Note, NoteTag, Tag], daos: [NoteDao, TagDao, NoteTagDao])
class MyDatabase extends _$MyDatabase {
  static MyDatabase _instance;

  static MyDatabase get getInstance {
    _instance ??= MyDatabase._();
    return _instance;
  }

  MyDatabase._()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: false, singleInstance: true));

  @override
  int get schemaVersion => 1;
}
