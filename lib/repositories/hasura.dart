import 'package:hasura_connect/hasura_connect.dart';

final String url = 'https://mypocketspace.herokuapp.com/v1/graphql';
final HasuraConnect hasura = HasuraConnect(url);

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

/*

subscription noteSubscription($userId:String!){
  note(where: {note_user_id: {_eq: $userId}}) {
    note_id
    note_title
    note_content
    note_created_at
    note_updated_at
  }
}


*/

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

//uuid

final notesUpdate = ''' 
mutation updateNote(\$content:String!,\$title:String!,\$noteId:String!,\$userId:Int!) {

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
