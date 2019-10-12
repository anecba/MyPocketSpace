import 'package:flutter/material.dart';
import 'package:my_pocket_space/paginas/telaCriandoAnotacoes.dart';

class MinhaPaginaPrincipal extends StatefulWidget {
  @override
  _MinhaPaginaPrincipalState createState() => _MinhaPaginaPrincipalState();
}

class _MinhaPaginaPrincipalState extends State<MinhaPaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            menuSuperior(),
            //listaCategorias(),
            SizedBox(
              height: 20,
            ),
            expansedTile(),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.black,
              color: Colors.pink[200],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (TelaCriarAnotacoes())));
              },
              child: Text("Criar novo"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget menuSuperior() {
  return Container(
    child: Row(
      children: <Widget>[
        //pesquisa(),
         IconButton(
          icon: Icon(Icons.search),
          color: Colors.purple,
          onPressed: () {},
        ), 
      ],
    ),
  );
}

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
}

Widget expansedTile() {
  return Container(
    child: ExpansionTile(
      backgroundColor: Colors.pink[200],
      title: Text("Anotações realizadas aqui"),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Vou colocar o resto do texto aqui"),
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
 