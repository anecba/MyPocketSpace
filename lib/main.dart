import 'package:flutter/material.dart';
import 'package:my_pocket_space/paginas/tabs.page.dart';

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
      home: DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );  
  }
}  