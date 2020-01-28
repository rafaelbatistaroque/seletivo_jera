import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:seletivo_jera/controllers/home_c.dart';
import 'package:seletivo_jera/controllers/login.c.dart';
import 'package:seletivo_jera/models/filme_m.dart';
import 'package:seletivo_jera/models/usuario_m.dart';

class Home extends StatelessWidget {
  final Usuario usuarioPerfil;
  const Home({this.usuarioPerfil});

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
    final homeController = Provider.of<HomeController>(context);
    final _textoPesquisaControler = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('${usuarioPerfil.nome}'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.star), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textoPesquisaControler,
                    decoration: InputDecoration(
                      hintText: 'Digite seu filme',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                RaisedButton(
                    child: Text('Pesquisar'),
                    color: Colors.green,
                    onPressed: () => homeController
                        .pesquisarFilmes(_textoPesquisaControler.text)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
                future: homeController.obterListadeFilmes(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      ); //Constrói a animação circular de espera.
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return Observer(builder: (_) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: homeController.filmes.length,
                              itemBuilder: (context, index) {
                                var filme = homeController.filmes[index];
                                return _contruirCardDeFilme(filme, () {
                                  homeController.marcarComoFavorito(
                                      loginController.loginAtual.idSecao,
                                      homeController.filmes[index]);
                                });
                              });
                        });
                  }
                }),
          )
        ],
      ),
    );
  }

  _contruirCardDeFilme(Filme filme, Function marcarFavorito) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network(
              'http://image.tmdb.org/t/p/w185/${filme.poster}',
              fit: BoxFit.cover,
              width: 100,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Wrap(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(filme.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {}), //TODO: Obter id do Filme para favoritar
          ],
        ),
      ),
    );
  }
}
