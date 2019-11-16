// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dao.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NoteData extends DataClass implements Insertable<NoteData> {
  final String uid;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  NoteData(
      {@required this.uid,
      @required this.title,
      @required this.content,
      @required this.createdAt,
      @required this.updatedAt});
  factory NoteData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return NoteData(
      uid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uid']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  factory NoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return NoteData(
      uid: serializer.fromJson<String>(json['uid']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'uid': serializer.toJson<String>(uid),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  @override
  NoteCompanion createCompanion(bool nullToAbsent) {
    return NoteCompanion(
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  NoteData copyWith(
          {String uid,
          String title,
          String content,
          DateTime createdAt,
          DateTime updatedAt}) =>
      NoteData(
        uid: uid ?? this.uid,
        title: title ?? this.title,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('uid: $uid, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      uid.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(content.hashCode,
              $mrjc(createdAt.hashCode, updatedAt.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.uid == this.uid &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<String> uid;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const NoteCompanion({
    this.uid = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NoteCompanion.insert({
    @required String uid,
    @required String title,
    @required String content,
    @required DateTime createdAt,
    @required DateTime updatedAt,
  })  : uid = Value(uid),
        title = Value(title),
        content = Value(content),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  NoteCompanion copyWith(
      {Value<String> uid,
      Value<String> title,
      Value<String> content,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return NoteCompanion(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NoteTable(this._db, [this._alias]);
  final VerificationMeta _uidMeta = const VerificationMeta('uid');
  GeneratedTextColumn _uid;
  @override
  GeneratedTextColumn get uid => _uid ??= _constructUid();
  GeneratedTextColumn _constructUid() {
    return GeneratedTextColumn('uid', $tableName, false,
        minTextLength: 1, maxTextLength: 46);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [uid, title, content, createdAt, updatedAt];
  @override
  $NoteTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'note';
  @override
  final String actualTableName = 'note';
  @override
  VerificationContext validateIntegrity(NoteCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.uid.present) {
      context.handle(_uidMeta, uid.isAcceptableValue(d.uid.value, _uidMeta));
    } else if (uid.isRequired && isInserting) {
      context.missing(_uidMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (content.isRequired && isInserting) {
      context.missing(_contentMeta);
    }
    if (d.createdAt.present) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableValue(d.createdAt.value, _createdAtMeta));
    } else if (createdAt.isRequired && isInserting) {
      context.missing(_createdAtMeta);
    }
    if (d.updatedAt.present) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableValue(d.updatedAt.value, _updatedAtMeta));
    } else if (updatedAt.isRequired && isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NoteData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NoteData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(NoteCompanion d) {
    final map = <String, Variable>{};
    if (d.uid.present) {
      map['uid'] = Variable<String, StringType>(d.uid.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.createdAt.present) {
      map['created_at'] = Variable<DateTime, DateTimeType>(d.createdAt.value);
    }
    if (d.updatedAt.present) {
      map['updated_at'] = Variable<DateTime, DateTimeType>(d.updatedAt.value);
    }
    return map;
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(_db, alias);
  }
}

class NoteTagData extends DataClass implements Insertable<NoteTagData> {
  final String noteId;
  final String tagId;
  NoteTagData({@required this.noteId, @required this.tagId});
  factory NoteTagData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NoteTagData(
      noteId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}note_id']),
      tagId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}tag_id']),
    );
  }
  factory NoteTagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return NoteTagData(
      noteId: serializer.fromJson<String>(json['noteId']),
      tagId: serializer.fromJson<String>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'noteId': serializer.toJson<String>(noteId),
      'tagId': serializer.toJson<String>(tagId),
    };
  }

  @override
  NoteTagCompanion createCompanion(bool nullToAbsent) {
    return NoteTagCompanion(
      noteId:
          noteId == null && nullToAbsent ? const Value.absent() : Value(noteId),
      tagId:
          tagId == null && nullToAbsent ? const Value.absent() : Value(tagId),
    );
  }

  NoteTagData copyWith({String noteId, String tagId}) => NoteTagData(
        noteId: noteId ?? this.noteId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('NoteTagData(')
          ..write('noteId: $noteId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(noteId.hashCode, tagId.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is NoteTagData &&
          other.noteId == this.noteId &&
          other.tagId == this.tagId);
}

class NoteTagCompanion extends UpdateCompanion<NoteTagData> {
  final Value<String> noteId;
  final Value<String> tagId;
  const NoteTagCompanion({
    this.noteId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  NoteTagCompanion.insert({
    @required String noteId,
    @required String tagId,
  })  : noteId = Value(noteId),
        tagId = Value(tagId);
  NoteTagCompanion copyWith({Value<String> noteId, Value<String> tagId}) {
    return NoteTagCompanion(
      noteId: noteId ?? this.noteId,
      tagId: tagId ?? this.tagId,
    );
  }
}

class $NoteTagTable extends NoteTag with TableInfo<$NoteTagTable, NoteTagData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NoteTagTable(this._db, [this._alias]);
  final VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  GeneratedTextColumn _noteId;
  @override
  GeneratedTextColumn get noteId => _noteId ??= _constructNoteId();
  GeneratedTextColumn _constructNoteId() {
    return GeneratedTextColumn(
      'note_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  GeneratedTextColumn _tagId;
  @override
  GeneratedTextColumn get tagId => _tagId ??= _constructTagId();
  GeneratedTextColumn _constructTagId() {
    return GeneratedTextColumn(
      'tag_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [noteId, tagId];
  @override
  $NoteTagTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'note_tag';
  @override
  final String actualTableName = 'note_tag';
  @override
  VerificationContext validateIntegrity(NoteTagCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.noteId.present) {
      context.handle(
          _noteIdMeta, noteId.isAcceptableValue(d.noteId.value, _noteIdMeta));
    } else if (noteId.isRequired && isInserting) {
      context.missing(_noteIdMeta);
    }
    if (d.tagId.present) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableValue(d.tagId.value, _tagIdMeta));
    } else if (tagId.isRequired && isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NoteTagData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NoteTagData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(NoteTagCompanion d) {
    final map = <String, Variable>{};
    if (d.noteId.present) {
      map['note_id'] = Variable<String, StringType>(d.noteId.value);
    }
    if (d.tagId.present) {
      map['tag_id'] = Variable<String, StringType>(d.tagId.value);
    }
    return map;
  }

  @override
  $NoteTagTable createAlias(String alias) {
    return $NoteTagTable(_db, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final String uid;
  final String name;
  TagData({@required this.uid, @required this.name});
  factory TagData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return TagData(
      uid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uid']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TagData(
      uid: serializer.fromJson<String>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'uid': serializer.toJson<String>(uid),
      'name': serializer.toJson<String>(name),
    };
  }

  @override
  TagCompanion createCompanion(bool nullToAbsent) {
    return TagCompanion(
      uid: uid == null && nullToAbsent ? const Value.absent() : Value(uid),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  TagData copyWith({String uid, String name}) => TagData(
        uid: uid ?? this.uid,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('uid: $uid, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(uid.hashCode, name.hashCode));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TagData && other.uid == this.uid && other.name == this.name);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<String> uid;
  final Value<String> name;
  const TagCompanion({
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
  });
  TagCompanion.insert({
    @required String uid,
    @required String name,
  })  : uid = Value(uid),
        name = Value(name);
  TagCompanion copyWith({Value<String> uid, Value<String> name}) {
    return TagCompanion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
    );
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TagTable(this._db, [this._alias]);
  final VerificationMeta _uidMeta = const VerificationMeta('uid');
  GeneratedTextColumn _uid;
  @override
  GeneratedTextColumn get uid => _uid ??= _constructUid();
  GeneratedTextColumn _constructUid() {
    return GeneratedTextColumn('uid', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 6, maxTextLength: 32);
  }

  @override
  List<GeneratedColumn> get $columns => [uid, name];
  @override
  $TagTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tag';
  @override
  final String actualTableName = 'tag';
  @override
  VerificationContext validateIntegrity(TagCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.uid.present) {
      context.handle(_uidMeta, uid.isAcceptableValue(d.uid.value, _uidMeta));
    } else if (uid.isRequired && isInserting) {
      context.missing(_uidMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TagData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TagData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TagCompanion d) {
    final map = <String, Variable>{};
    if (d.uid.present) {
      map['uid'] = Variable<String, StringType>(d.uid.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    return map;
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NoteTable _note;
  $NoteTable get note => _note ??= $NoteTable(this);
  $NoteTagTable _noteTag;
  $NoteTagTable get noteTag => _noteTag ??= $NoteTagTable(this);
  $TagTable _tag;
  $TagTable get tag => _tag ??= $TagTable(this);
  @override
  List<TableInfo> get allTables => [note, noteTag, tag];
}
