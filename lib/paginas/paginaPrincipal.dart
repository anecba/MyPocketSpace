import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_pocket_space/models/note.dart';
import 'package:my_pocket_space/paginas/telaCriandoAnotacoes.dart';
import 'package:my_pocket_space/repositories/hasura.dart';

class MinhaPaginaPrincipal extends StatefulWidget {
  @override
  _MinhaPaginaPrincipalState createState() => _MinhaPaginaPrincipalState();
}

class _MinhaPaginaPrincipalState extends State<MinhaPaginaPrincipal> {
  Snapshot<List<Note>> notes;
  @override
  void initState() {
    notes = hasura.subscription(notesSubscription).map((notes) =>
        notes['data']['note'].map<Note>((i) => Note.fromJson(i)).toList());
    super.initState();
  }

  /*  @override
  void dispose() {
    notes.close();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Note>>(
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return expansedTile(snapshot.data[index]);
            },
            itemCount: snapshot.data.length,
          );
        },
        stream: notes.stream,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => (PaginaCriarAnotacoes())));
        },
      ),
    );
  }
}

Widget menuSuperior() {
  return Container(
    child: Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.purple,
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget expansedTile(Note note) {
  return Container(
    child: ExpansionTile(
      backgroundColor: Colors.pink[200],
      title: Text(note.title),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(note.content),
            IconButton(
              icon: Icon(Icons.launch),
              color: Colors.purple,
              onPressed: () {},
            )
          ],
        ),
      ],
    ),
  );
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Urânia",
    "Jales",
    "Votuporanga",
    "Fernandopolis",
    "Estrela D'Oeste",
    "Santa fé do Sul",
    "Iturama",
    "São José do Rio Preto",
  ];

  final recentCities = [
    "Estrela D'Oeste",
    "Santa fé do Sul",
    "Iturama",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for appBar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    return Container(
      height: 100,
      child: Card(
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
