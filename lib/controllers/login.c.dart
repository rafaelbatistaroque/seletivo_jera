import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:seletivo_jera/models/login_m.dart';
import 'package:seletivo_jera/repositories/login_rep.dart';
import 'package:seletivo_jera/views/perfil.dart';
part 'login.c.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  Login loginAtual;

  @observable
  int qntPerfil;

  LoginControllerBase() {
    loginAtual = Login();
    qntPerfil = loginAtual.qntPerfis;
  }

  @action
  realizarLogin(BuildContext context) async {
    LoginRep _loginRepositorio = LoginRep();

    loginAtual.token = await _loginRepositorio.obterToken();
    await _loginRepositorio.autenticarUsuario(loginAtual);
    await _loginRepositorio.obterIdSecao(loginAtual.token).then((resposta) {
      if (resposta != null) {
        loginAtual.idSecao = resposta;
        adicionarMaisUmQntPerfil();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PerfilPage()));
      }
    });
  }

  @action
  adicionarMaisUmQntPerfil() {
    this.loginAtual.qntPerfis++;
    this.qntPerfil = this.loginAtual.qntPerfis;
  }
}
