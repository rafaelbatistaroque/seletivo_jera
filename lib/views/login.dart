import 'package:flutter/material.dart';
import 'package:seletivo_jera/controllers/login.c.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  LoginController loginC = LoginController();
  var usuario, senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telaLogin(),
    );
  }

  Widget _telaLogin() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 100),
            Text('login',
                style: TextStyle(color: Colors.green, fontSize: 28),
                textAlign: TextAlign.center),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Usuário"),
              style: TextStyle(fontSize: 20),
              validator: (value) {
                if (value.isEmpty) return 'Usuário Inválido';
                return null;
              },
              onSaved: (inputBoxUsuario) {
                usuario = inputBoxUsuario;
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
              onSaved: (inputBoxSenha) {
                senha = inputBoxSenha;
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              padding: EdgeInsets.all(10),
              color: Colors.green,
              child: Text('Acessar'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  loginC.realizarLogin(usuario, senha, context);
                }
              },
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text('Não sou cadastrado'),
                  onPressed: () {},
                ))
          ],
        ),
      ),
    );
  }
}
