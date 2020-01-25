import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seletivo_jera/Api/api_moviedb.dart';
import 'package:seletivo_jera/models/login_m.dart';
import 'package:seletivo_jera/repositories/login_rep.dart';
import 'package:seletivo_jera/services/dio_singleton.dart';
import 'package:seletivo_jera/views/home.dart';

class LoginController {
  LoginRep _loginRep = LoginRep();
  Login _login = Login();

  realizarLogin(String usuario, String senha, BuildContext context) async {
    this._login.usuario = usuario;
    this._login.senha = senha;

    _login.token = await _loginRep.obterToken();
    await _loginRep.autenticarUsuario(_login);
    await _loginRep.obterIdSecao(this._login.token).then((result) {
      this._login.idSecao = result;
      if (this._login.idSecao != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home(_login)),
        );
        return;
      }
    });
  }
}
