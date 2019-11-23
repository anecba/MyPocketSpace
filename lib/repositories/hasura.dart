import 'package:hasura_connect/hasura_connect.dart';

final String url = 'https://mypocketspace.herokuapp.com/v1/graphql';
final HasuraConnect hasura = HasuraConnect(url);

class NoteUpdateDto {
  final int uid;
  final String title;
  final String content;

  NoteUpdateDto(this.title, this.content, this.uid);
}

class NoteCreateDto {
  final String title;
  final String content;

  NoteCreateDto(this.title, this.content);
}

Future<void> save(NoteCreateDto note) async {
  try {
    await hasura.mutation(notesInsert,
        variables: {'title': note.title, 'content': note.content});
  } catch (e) {
    rethrow;
  }
}

Future<void> update(NoteUpdateDto note) async {
  try {
    await hasura.mutation(notesUpdate, variables: {
      'title': note.title,
      'content': note.content,
      'noteId': note.uid,
      'userId': 1
    });
  } catch (e) {
    rethrow;
  }
}

final String notesSubscription = ''' 
subscription NoteSubscription {
  note {
    note_id
    note_title
    note_updated_at
    note_content
    note_created_at
  }
}
''';

//Criando o meu insert
final notesInsert = '''
mutation addNote(\$title:String!,\$content:String!) {
  insert_note(objects: {note_content: \$content, note_title: \$title, note_user_id: "1"}) {
    returning {
      note_id
    }
  }
}

''';

//

final notesUpdate = ''' 
mutation updateNote(\$content:String!,\$title:String!,\$noteId:bigint!,\$userId:bigint!) {

  update_note(_set: {note_content: \$content, note_title: \$title}, where: {note_id: {_eq: \$noteId}, note_user_id: {_eq: \$userId}}) {
    returning {
      note_id
      note_content
      note_title
    }
  }
}

''';

final notesDelete = '''
mutation deleteNote(\$noteId:String!) {
  delete_note(where: {note_id: {_eq: \$noteId}}) {
    returning {
      note_id
    }
  }
}

''';
