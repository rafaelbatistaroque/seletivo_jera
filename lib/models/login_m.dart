import 'package:mobx/mobx.dart';
part 'login_m.g.dart';

class Login {
  String usuario;
  String senha;
  String token;
  int qntPerfis;

  Login({this.usuario, this.senha, this.token, this.qntPerfis = 0});

  Login.fromJson(Map<String, dynamic> json) {
    usuario = json['username'];
    senha = json['password'];
    token = json['request_token'];
    qntPerfis = json['qnt_perfis'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.usuario;
    data['password'] = this.senha;
    data['request_token'] = this.token;
    data['qnt_perfis'] = this.qntPerfis;
    return data;
  }
}
