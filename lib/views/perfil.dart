import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:seletivo_jera/controllers/perfis_c.dart';
import 'package:seletivo_jera/models/login_m.dart';
import 'package:seletivo_jera/models/usuario_m.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final perfilController = PerfilController();
    final loginAtual = Provider.of<Login>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Observer(builder: (_) {
          return Text('Selecione seu perfil');
        }),
      ),
      body: FutureBuilder(
          future: perfilController.carregarPerfilPadrao(loginAtual),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              case ConnectionState.done:
                return Observer(builder: (_) {
                  return ListView.builder(
                    itemCount: perfilController.listaUsuario.length,
                    itemBuilder: (_, index) {
                      var item = perfilController.listaUsuario[index];
                      return _construirListTile(item);
                    },
                  );
                });
              default:
                return Container(
                    child: Center(
                  child: Text('Ops! Deu ruim'),
                ));
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return _cadastroDePerfisDialog(
                    context, loginAtual, perfilController);
              });
        },
      ),
    );
  }

  Widget _construirListTile(Usuario usuario) {
    return ListTile(
      title: Text(
        usuario.nome,
        style: TextStyle(color: Colors.green),
      ),
      subtitle: Text('Id seção: ${usuario.idSecao}'),
      onTap: () {},
    );
  }

  Widget _cadastroDePerfisDialog(BuildContext context, Login loginAtual,
      PerfilController perfilController) {
    final _formKey = GlobalKey<FormState>();
    String nome, dataNasc, email, senha;

    return AlertDialog(
      title: Text('Cadastro de perfis'),
      content: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Nome"),
              style: TextStyle(fontSize: 14),
              validator: (value) {
                if (value.isEmpty) return 'Nome não pode ser vazio';
                return null;
              },
              onSaved: (val) {
                nome = val;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(labelText: "Data Nascimento"),
              style: TextStyle(fontSize: 14),
              validator: (value) {
                if (value.isEmpty) return 'Data não pode ser vazio';
                return null;
              },
              onSaved: (val) {
                dataNasc = val;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
              style: TextStyle(fontSize: 14),
              validator: (value) {
                if (value.isEmpty) return 'Email não pode ser vazio';
                return null;
              },
              onSaved: (val) {
                email = val;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
              style: TextStyle(fontSize: 14),
              validator: (value) {
                if (value.isEmpty) return 'Senha não pode ser vazia';
                return null;
              },
              onSaved: (val) {
                senha = val;
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Salvar'),
            onPressed: () {
              if (loginAtual.qntPerfis <= 4 &&
                  _formKey.currentState.validate()) {
                _formKey.currentState.save();
                perfilController.adicionarNovoPerfil(
                    nome, email, senha, dataNasc);
                Navigator.pop(context);
              }
            }),
        FlatButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
