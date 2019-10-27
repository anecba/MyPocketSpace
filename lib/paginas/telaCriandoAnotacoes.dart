import 'package:flutter/material.dart';
import '../main.dart';

class TelaCriarAnotacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pocket Space',
      //o app utiliza o theme como cores da fonte. Isso influencia no expansedTile.
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PaginaCriarAnotacoes(),
    );
  }
}

class PaginaCriarAnotacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.assignment_return),
                        color: Colors.pink,
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () {},
                        color: Colors.pink,
                        icon: Icon(Icons.settings),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30),
                /* Container(
                  child: Expanded(
                    child: TextFormField(
                      //autofocus: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ), */
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
        ),
      ],
    ));
  }
}
