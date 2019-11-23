import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_pocket_space/paginas/paginaPrincipal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Pocket Space',
      home: MinhaPaginaPrincipal(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        const Locale('pt', 'BR'),
        const Locale('en', 'US'),
      ],
    );
  }
}
/*
class Example08 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        itemCount: 10,
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) => AnotationWidget(index),
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }
}

class AnotationWidget extends StatelessWidget {
  const AnotationWidget(this.index, {this.title, this.content, this.date});
  final String title;
  final String content;
  final DateTime date;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Image number $index Image number $index Image number $index Image number $index',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.5,
                    ),
                  ),
                  Text(
                    index.isEven
                        ? 'Iasdsahdh hashd nusahde hbhybyh nausb iehuduhuh ahbshb a s as  sds a e tgfe v'
                        : 'aasaSA asdasdsadas',
                    maxLines: 4,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Height:',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
