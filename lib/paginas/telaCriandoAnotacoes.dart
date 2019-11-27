import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_pocket_space/dao/dao.dart';
import 'package:my_pocket_space/dao/note_dao.dart';
import 'package:my_pocket_space/repositories/hasura.dart';

class PaginaCriarAnotacoes extends StatefulWidget {
  @override
  _PaginaCriarAnotacoesState createState() => _PaginaCriarAnotacoesState();
}

class _PaginaCriarAnotacoesState extends State<PaginaCriarAnotacoes> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController;
  TextEditingController _bodyController;
  int characterAmount = 0;
  final _noteDao = NoteDao(MyDatabase.getInstance);

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

  void onEditText() {
    setState(() {
      characterAmount =
          _titleController.text.length + _bodyController.text.length;
    });
  }

  Future<void> saveDataAdd() async {
    final title = _titleController.text;
    final body = _bodyController.text;
    final isEmpty = title.isEmpty && body.isEmpty;
    if (!isEmpty) {
      _noteDao.insert(NoteCreateDto(title, body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        saveDataAdd();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CupertinoNavigationBarBackButton(
            color: Colors.orange,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "${DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).add_Hm().format(DateTime.now())} | $characterAmount caracteres",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Container(
                        child: TextFormField(
                          autofocus: true,
                          onChanged: (e) {
                            onEditText();
                          },
                          controller: _titleController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Título',
                          ),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 30),
                      child: Container(
                        child: TextFormField(
                          onChanged: (e) {
                            onEditText();
                          },
                          controller: _bodyController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.text,
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Digite aqui...'),
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
