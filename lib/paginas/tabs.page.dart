import 'package:flutter/material.dart';
import 'package:my_pocket_space/paginas/login.dart';
import 'package:my_pocket_space/paginas/paginaPrincipal.dart';
import 'package:my_pocket_space/paginas/telaCriandoAnotacoes.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          MinhaPaginaPrincipal(),
          LoginPage(),
          TelaCriarAnotacoes()
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
          Tab(
            icon: Icon(Icons.offline_pin),
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}