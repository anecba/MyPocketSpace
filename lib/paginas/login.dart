import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pocket_space/paginas/cadastro.dart';
import 'package:my_pocket_space/paginas/tabs.page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF20c6b6),
            Color(0xFF008080),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                //VER SE ALGUM DIA ARRUMO ESSA GAMBIARRA!
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.account_balance,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(height: 10),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 42,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Segunda repartição com Os campos para serem preenchidos
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    //container do campo Email
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 35, right: 35),
                      // este padding aqui arruma o text dado um bom posicionamento.
                      padding: EdgeInsets.only(
                          top: 1, left: 16, right: 16, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            //colocando sombra só mais em baixo e nas laterais
                            offset: Offset(0, 5),
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      //campo para escrever
                      child: TextField(
                        //autofocus: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.mail, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    //container do campo password ALTEARANDO ALEATORIO
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 35, right: 35),
                      // este padding aqui arruma o text dado um bom posicionamento.
                      padding: EdgeInsets.only(
                          top: 1, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            //colocando sombra só mais em baixo e nas laterais
                            offset: Offset(0, 5),
                            color: Colors.black12,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      //campo para escrever
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //eventualmente tirar esse align eu acho... aqui é o forgot password
              Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 45,
                    ),
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              //minha maneira de dar um espaçamento ja q o negocio deu ruim.
              SizedBox(height: 60),
              //meu botão pra logar
              //AQUI FICA MEU BOTAO
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabsPage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  padding: const EdgeInsets.only(
                      left: 10, bottom: 12, top: 12, right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF20c6b6),
                        Color(0xFF1a9e92),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(60),
                    //border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        //colocando sombra só mais em baixo e nas laterais
                        offset: Offset(0, 5),
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //criar conta
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (CadastroPage())));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        'Não possui uma conta? Cadastre-se Aquí!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: () {
                    /*
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (PaginaPrincipal())));
                            */
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      //CRIANDO UMA OPÇÃO PARA ACESSAR SEM FAZER LOGIN
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.arrow_forward,
                              size: 15, color: Colors.white),
                          Text(
                            'Continuar sem cadastro',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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
}
