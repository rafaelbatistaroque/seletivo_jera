class Usuario {
  String nome;
  String email;
  String senha;
  String dataNasc;
  String idSecao;

  Usuario({this.nome, this.email, this.senha, this.dataNasc, this.idSecao});

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    email = json['email'];
    senha = json['password'];
    dataNasc = json['data_nasc'];
    idSecao = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.nome;
    data['email'] = this.email;
    data['password'] = this.senha;
    data['data_nasc'] = this.dataNasc;
    data['session_id'] = this.idSecao;

    return data;
  }
}
