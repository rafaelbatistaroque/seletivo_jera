class Usuario {
  String nome;
  String email;
  String senha;
  String dataNasc;
  String token;

  Usuario({this.nome, this.email, this.senha, this.dataNasc, this.token});

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['username'];
    email = json['email'];
    senha = json['password'];
    dataNasc = json['data_nasc'];
    token = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.nome;
    data['email'] = this.email;
    data['password'] = this.senha;
    data['data_nasc'] = this.dataNasc;
    data['request_token'] = this.token;

    return data;
  }
}
