import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:seletivo_jera/controllers/login.c.dart';
import 'package:seletivo_jera/controllers/perfis_c.dart';
import 'package:seletivo_jera/models/usuario_m.dart';
import 'package:seletivo_jera/views/home.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);
    final perfilController = Provider.of<PerfilController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Observer(
            builder: (_) => Text(
                'Selecione seu perfil ${loginController.loginAtual.usuario}')),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: perfilController.listaUsuario.length,
          itemBuilder: (_, index) {
            var item = perfilController.listaUsuario[index];
            return _construirListTile(
              item,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      Home(usuarioPerfil: perfilController.listaUsuario[index]),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (loginController.qntPerfil < 4) {
            showDialog(
                context: context,
                builder: (_) {
                  return _cadastroDePerfisDialog(context,
                      (nome, dataNasc, email, senha) {
                    perfilController.adicionarNovoPerfil(
                        nome: nome,
                        email: email,
                        senha: senha,
                        dataNasc: dataNasc);
                  }, () {
                    loginController.adicionarMaisUmQntPerfil();
                  });
                });
          } else
            return null;
        },
      ),
    );
  }

//=======================
//Item Lista
//=======================
  Widget _construirListTile(Usuario usuario, Function irParaHome) {
    return ListTile(
      title: Text(
        usuario.nome,
        style: TextStyle(color: Colors.green),
      ),
      subtitle: Text('Id seção: ${usuario.idSecao}'),
      onTap: irParaHome,
    );
  }

//==================================
//Formulário de CAadstro AlertDialog
//==================================
  Widget _cadastroDePerfisDialog(BuildContext context,
      Function adicionarNovoPerfil, Function adicionarMaisUm) {
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
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                adicionarNovoPerfil(nome, email, senha, dataNasc);
                adicionarMaisUm();
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
