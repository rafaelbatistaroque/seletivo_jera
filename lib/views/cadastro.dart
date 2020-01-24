import 'package:flutter/material.dart';
import 'package:seletivo_jera/models/usuario_m.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  var usuario = new Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telaCadastro(),
    );
  }

  Widget _telaCadastro() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 100),
            Text('Cadastro de usuário',
                style: TextStyle(color: Colors.green, fontSize: 28),
                textAlign: TextAlign.center),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Nome"),
              style: TextStyle(fontSize: 20),
              validator: (value) {
                if (value.isEmpty) return 'Nome Inválido';
                return null;
              },
              onSaved: (val) {
                usuario.nome = val;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(labelText: "Data Nascimento"),
              style: TextStyle(
                fontSize: 20,
              ),
              validator: (value) {
                if (value.isEmpty) return 'Data Inválida';

                return null;
              },
              onSaved: (val) {
                usuario.dataNasc = val;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
              style: TextStyle(
                fontSize: 20,
              ),
              validator: (value) {
                if (value.isEmpty) return 'Email Inválido';

                return null;
              },
              onSaved: (val) {
                usuario.email = val;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
              style: TextStyle(
                fontSize: 20,
              ),
              validator: (value) {
                if (value.isEmpty) return 'Senha Inválida';

                return null;
              },
              onSaved: (val) {
                usuario.senha = val;
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              padding: EdgeInsets.all(10),
              color: Colors.green,
              child: Text('Criar Conta'),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            RaisedButton(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text('Com Facebook'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
