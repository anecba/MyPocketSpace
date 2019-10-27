import 'package:flutter/material.dart';
import '../main.dart';

class PaginaCriarAnotacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Expanded(
              child: TextFormField(
                expands: true,
                autofocus: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                maxLines: null,
                maxLength: 30,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: TextFormField(
                expands: true,
                autofocus: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                maxLines: null,
                maxLength: 30,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.purple,
              color: Colors.pink[200],
              onPressed: () {},
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
