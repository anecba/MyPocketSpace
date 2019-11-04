import 'package:flutter/material.dart';
import 'package:my_pocket_space/paginas/paginaPrincipal.dart';
import 'package:my_pocket_space/paginas/telaCriandoAnotacoes.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            MinhaPaginaPrincipal(),
            PaginaCriarAnotacoes(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.time_to_leave),
            ),
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.black38,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
