import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_pocket_space/Componentes/annotation_widget.dart';
import 'package:my_pocket_space/models/note.dart';
import 'package:my_pocket_space/paginas/edit_annotation.dart';
import 'package:my_pocket_space/paginas/telaCriandoAnotacoes.dart';
import 'package:my_pocket_space/repositories/hasura.dart';

class MinhaPaginaPrincipal extends StatefulWidget {
  @override
  _MinhaPaginaPrincipalState createState() => _MinhaPaginaPrincipalState();
}

class _MinhaPaginaPrincipalState extends State<MinhaPaginaPrincipal> {
  bool select = false;

  Snapshot<List<Note>> notes;
  @override
  void initState() {
    notes = hasura.subscription(notesSubscription).map((notes) =>
        notes['data']['note'].map<Note>((i) => Note.fromJson(i)).toList());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Anotações',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<List<Note>>(
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return StaggeredGridView.countBuilder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            itemCount: snapshot.data.length,
            primary: false,
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              final item = snapshot.data[index];
              return AnnotationWidget(
                title: item.title,
                content: item.content,
                date: item.createdAt,
                select: select,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => EditAnnotationPage(
                                note: item,
                              )));
                },
                onLongPress: () {
                  setState(() {
                    select = !select;
                  });
                },
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          );
        },
        stream: notes.stream,
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => (PaginaCriarAnotacoes()),
            ),
          );
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
