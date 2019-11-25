import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_pocket_space/Componentes/annotation_widget.dart';
import 'package:my_pocket_space/dao/dao.dart';
import 'package:my_pocket_space/dao/note_dao.dart';
import 'package:my_pocket_space/paginas/edit_annotation.dart';
import 'package:my_pocket_space/paginas/telaCriandoAnotacoes.dart';

class MinhaPaginaPrincipal extends StatefulWidget {
  @override
  _MinhaPaginaPrincipalState createState() => _MinhaPaginaPrincipalState();
}

class _MinhaPaginaPrincipalState extends State<MinhaPaginaPrincipal> {
  var controller;
  final _noteDao = NoteDao(MyDatabase.getInstance);
  final _blackList = <NoteData>[];
  bool select = false;
  String ordenation = 'normal';

  Stream<List<NoteData>> notes;
  @override
  void initState() {
    notes = _noteDao.notes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addToBlackList(NoteData note) {
    if (_blackList.contains(note)) {
      _blackList.remove(note);
    } else {
      _blackList.add(note);
    }
    print(_blackList);
    setState(() {});
  }

  void orderByDate(List<NoteData> notes) {
    notes.sort(
        (before, current) => before.createdAt.compareTo(current.createdAt));
  }

  void orderByLetter(List<NoteData> notes) {
    notes
        .sort((before, current) => before.title[0].compareTo(current.title[0]));
  }

  void orderById(List<NoteData> notes) {
    notes.sort((before, current) => before.id.compareTo(current.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Anotações',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.orange),
            onPressed: () {},
          ),
          PopupMenuButton(
            tooltip: 'Ordenação de notas',
            onSelected: (selected) {
              print(selected);
              setState(() {
                ordenation = selected;
              });
            },
            icon: Icon(
              Icons.sort_by_alpha,
              color: Colors.orange,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'normal',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.close, color: Colors.orange, size: 19),
                      SizedBox(width: 15),
                      Text('Padrão')
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'date',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today,
                          color: Colors.orange, size: 19),
                      SizedBox(width: 15),
                      Text('Data')
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'alfabetic',
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.sort_by_alpha, color: Colors.orange, size: 19),
                      SizedBox(width: 15),
                      Text('Alfabético')
                    ],
                  ),
                )
              ];
            },
          )
        ],
      ),
      body: StreamBuilder<List<NoteData>>(
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          final items = List<NoteData>.from(snapshot.data);

          if (ordenation == 'date') {
            orderByDate(items);
          } else if (ordenation == 'alfabetic') {
            orderByLetter(items);
          } else {
            orderById(items);
          }
          print('aaa');
          items.forEach((e) {
            print(e.id);
          });

          return StaggeredGridView.countBuilder(
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 15, bottom: 120),
            itemCount: items.length,
            primary: false,
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              final item = items[index];
              return AnnotationWidget(
                title: item.title,
                content: item.content,
                date: item.createdAt,
                select: select,
                marked: _blackList.contains(item),
                addToBlackList: () {
                  addToBlackList(item);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => EditAnnotationPage(
                        note: item,
                      ),
                    ),
                  );
                },
                onLongPress: () {
                  if (controller == null) {
                    addToBlackList(item);
                    controller = showBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return Container(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.restore_from_trash),
                                    onPressed: () async {
                                      if (_blackList.isNotEmpty) {
                                        await _noteDao.remove(_blackList
                                            .map((e) => e.id)
                                            .toList());
                                      }
                                    })
                              ],
                            ),
                          );
                        });
                  } else {
                    controller.close();
                  }

                  controller.closed.then((e) {
                    _blackList.clear();
                    setState(() {
                      select = !select;
                      controller = null;
                    });
                  });

                  setState(() {
                    select = !select;
                  });
                },
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          );
        },
        stream: notes,
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => PaginaCriarAnotacoes(),
            ),
          );
        },
      ),
    );
  }
}
