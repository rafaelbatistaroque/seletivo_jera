import 'package:flutter/material.dart';
import 'package:seletivo_jera/models/login_m.dart';
import 'package:seletivo_jera/repositories/login_rep.dart';
import 'package:seletivo_jera/views/perfil.dart';

class LoginController {
  realizarLogin(Login loginAtual, BuildContext context) async {
    LoginRep _loginRepositorio = LoginRep();

    loginAtual.token = await _loginRepositorio.obterToken();

    await _loginRepositorio.autenticarUsuario(loginAtual).then((resposta) {
      if (resposta.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PerfilPage()));
      }
      return;
    });
  }
}
