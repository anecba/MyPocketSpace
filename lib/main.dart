import 'package:flutter/material.dart';
import 'package:my_pocket_space/telaCriandoAnotacoes.dart';
//import 'package:flutter/src/rendering/box.dart'

void main() => runApp(PaginaPrincipal());

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pocket Space',
      //o app utiliza o theme como cores da fonte. Isso influencia no expansedTile.
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MinhaPaginaPrincipal(title: 'Minhas anotações'),
    );
  }
}

class MinhaPaginaPrincipal extends StatefulWidget {
  MinhaPaginaPrincipal({Key key, this.title}) : super(key: key);

  final String title;

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
            listaCategorias(),
            SizedBox(
              height: 20,
            ),
            expansedTile(),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.purple,
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
    //child: Image.asset()
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

Widget menuSuperior() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          color: Colors.purple,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.filter_list),
          color: Colors.purple,
          onPressed: () {},
        ),
      ],
    ),
  );
}
