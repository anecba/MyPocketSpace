import 'package:flutter/material.dart';

import 'main.dart';

class TelaCriarAnotacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pocket Space',
      //o app utiliza o theme como cores da fonte. Isso influencia no expansedTile.
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PaginaCriarAnotacoes(),
    );
  }
}

class PaginaCriarAnotacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.assignment_return),
                  color: Colors.pink,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (PaginaPrincipal())));
                  },
                ),
                IconButton(
                  onPressed: () {},
                  color: Colors.pink,
                  icon: Icon(Icons.settings),
                )
              ],
            ),
            //Usuário poderá digitar aqui
            Text(
              "Título",
              style: TextStyle(fontSize: 30),
            ),
            Container(
              height: 30,
            ),
            Container(
              height: 100,
              child: Text(
                  "Aqui ficarão as anotações que o usuário irá realizar...",
                  textAlign: TextAlign.start),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.purple,
              color: Colors.pink[200],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (PaginaPrincipal())));
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
