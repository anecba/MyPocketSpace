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

  /* @override
  void dispose() {
    notes.close();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.search)),
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
                    builder: (context) => (TelaCriarAnotacoes())));
          }),
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
/* 
Widget pesquisa() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black12.withOpacity(0.1),
      borderRadius: BorderRadius.all(
        Radius.circular(128),
      ),
    ),
    child: Row(
      children: <Widget>[
        Icon(Icons.search),
        TextFormField(
          autofocus: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Pesquisa...",
            labelStyle: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget listaCategorias() {
  return Container(
    height: 90,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        itemCategoria(),
        itemCategoria(),
        itemCategoria(),
        itemCategoria(),
        itemCategoria(),
        itemCategoria(),
        itemCategoria(),
        itemCategoria(),
      ],
    ),
  );
}

Widget itemCategoria() {
  return Container(
    width: 70,
    height: 70,
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(64))),
  );
} */

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
