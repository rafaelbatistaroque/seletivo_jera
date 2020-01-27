import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seletivo_jera/controllers/login.c.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context);

    return Scaffold(
      body: SafeArea(
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
                initialValue: 'maranata',
                decoration: InputDecoration(labelText: "Usuário"),
                style: TextStyle(fontSize: 20),
                validator: (value) {
                  if (value.isEmpty) return 'Usuário Inválido';
                  return null;
                },
                onSaved: (inputBoxUsuario) {
                  loginController.loginAtual.usuario = inputBoxUsuario;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: 'adm',
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
                  loginController.loginAtual.senha = inputBoxSenha;
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
                    loginController.realizarLogin(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
