import 'package:flutter/material.dart';
import 'package:my_pocket_space/telaCriandoAnotacoes.dart';

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
            Container(
              height: 20,
            ),
            Row(
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
            ExpansionTile(
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
