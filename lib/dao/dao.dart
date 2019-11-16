import 'package:moor_flutter/moor_flutter.dart';

part 'dao.g.dart';

class Note extends Table {
  TextColumn get uid => text().withLength(min: 1, max: 46)();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

class NoteTag extends Table {
  TextColumn get noteId => text()();
  TextColumn get tagId => text()();
}

class Tag extends Table {
  TextColumn get uid => text().withLength(min: 6, max: 32)();
  TextColumn get name => text().withLength(min: 6, max: 32)();
}

@UseMoor(tables: [Note, NoteTag, Tag])
class MyDatabase extends _$MyDatabase {
  MyDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;
}
