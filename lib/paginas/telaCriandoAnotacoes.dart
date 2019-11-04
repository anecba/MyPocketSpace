import 'package:flutter/material.dart';

class PaginaCriarAnotacoes extends StatefulWidget {
  @override
  _PaginaCriarAnotacoesState createState() => _PaginaCriarAnotacoesState();
}

class _PaginaCriarAnotacoesState extends State<PaginaCriarAnotacoes> {
  TextEditingController edt1, edt2;
  var _set;

  @override
  void initState() {
    edt1 = TextEditingController();
    edt2 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    edt1.dispose();
    edt2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: 20),
            Container(
              height: 60,
              color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.assignment_return),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: Icon(Icons.settings),
                  )
                ],
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: edt1,
                //expands: true,
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
            //SizedBox(height: 30),
            Expanded(
              child: TextFormField(
                controller: edt2,
                expands: true,
                autofocus: false,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                maxLines: null,
                maxLength: 30,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            /* RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.purple,
              color: Colors.pink[200],
              onPressed: () {},
              child: Text("Salvar"),
            ), */
          ],
        ),
      ),
    );
  }
}
/* 
Widget checkBox (bool _set){
  return Checkbox(
    onChanged: (bool resp){
      setState((){
        _set = resp;
      }
      );
    },
    value: _set,
  );
} */
