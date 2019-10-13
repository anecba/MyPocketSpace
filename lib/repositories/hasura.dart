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
''' ;