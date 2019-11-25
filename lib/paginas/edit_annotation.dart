import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_pocket_space/dao/dao.dart';
import 'package:my_pocket_space/dao/note_dao.dart';
import 'package:my_pocket_space/repositories/hasura.dart';
import 'package:share/share.dart';

class EditAnnotationPage extends StatefulWidget {
  final NoteData note;

  const EditAnnotationPage({Key key, this.note}) : super(key: key);

  @override
  _EditAnnotationPageState createState() => _EditAnnotationPageState();
}

class _EditAnnotationPageState extends State<EditAnnotationPage> {
  TextEditingController _titleController;
  TextEditingController _bodyController;
  final _noteDao = NoteDao(MyDatabase.getInstance);

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.note.title);
    _bodyController = TextEditingController(text: widget.note.content);

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  /* Future<void> saveData() async {
    final title = _titleController.text;
    final body = _bodyController.text;

    final notHasUpdate =
        widget.note.title == title || widget.note.content == body;
    if (!notHasUpdate) {
      _noteDao
          .change(NoteUpdateDto(title, body, widget.note.id, DateTime.now()));
    }
  } */

  Future<void> saveData() async {
    final title = _titleController.text;
    final body = _bodyController.text;

    final notHasUpdate =
        widget.note.title == title && widget.note.content == body;
    if (!notHasUpdate) {
      _noteDao
          .change(NoteUpdateDto(title, body, widget.note.id, DateTime.now()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        saveData();

        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: CupertinoNavigationBarBackButton(
            color: Colors.orange,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                Share.share(
                    '''${widget.note.title} - ${DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).add_Hm().format(widget.note.createdAt)}
${widget.note.content}
                ''');
              },
              icon: Icon(
                Icons.share,
                color: Colors.orange,
              ),
            ),
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.orange,
              ),
              itemBuilder: (context) {
                return ['Excluir', 'Favoritar']
                    .map((e) => PopupMenuItem(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.restore_from_trash),
                              SizedBox(width: 15),
                              Text(e)
                            ],
                          ),
                        ))
                    .toList();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "${DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).add_Hm().format(widget.note.createdAt)}",
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
                    decoration: InputDecoration.collapsed(hintText: 'Título'),
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
                    decoration:
                        InputDecoration.collapsed(hintText: 'Digite aqui...'),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future controller(_titleController, _bodyController) {}
}
