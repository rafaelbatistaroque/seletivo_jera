class Login {
  String usuario;
  String senha;
  String token;
  String idSecao;
  int qntPerfis;

  Login(
      {this.usuario, this.senha, this.token, this.idSecao, this.qntPerfis = 0});

  Login.fromJson(Map<String, dynamic> json) {
    usuario = json['username'];
    senha = json['password'];
    token = json['request_token'];
    idSecao = json['session_id'];
    qntPerfis = json['qnt_perfis'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.usuario;
    data['password'] = this.senha;
    data['request_token'] = this.token;
    data['session_id'] = this.idSecao;
    data['qnt_perfis'] = this.qntPerfis;
    return data;
  }
}
