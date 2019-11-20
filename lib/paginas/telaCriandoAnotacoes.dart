import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaginaCriarAnotacoes extends StatefulWidget {
  @override
  _PaginaCriarAnotacoesState createState() => _PaginaCriarAnotacoesState();
}

class _PaginaCriarAnotacoesState extends State<PaginaCriarAnotacoes> {
  TextEditingController _titleController;
  TextEditingController _bodyController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restore_from_trash),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  // "${DateFormat.yMd(Localizations.localeOf(context).languageCode).add_Hm().format(snapshot.data?.createdOn)}"
                  "${DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).add_Hm().format(DateTime.now())}",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Container(
                //color: Colors.redAccent,
                child: TextFormField(
                  controller: _titleController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Container(
                //color: Colors.redAccent,
                child: TextFormField(
                  controller: _bodyController,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
