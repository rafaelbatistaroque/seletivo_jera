class Login {
  String usuario;
  String senha;
  String token;

  Login({
    this.usuario,
    this.senha,
    this.token,
  });

  Login.fromJson(Map<String, dynamic> json) {
    usuario = json['username'];
    senha = json['password'];
    token = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.usuario;
    data['password'] = this.senha;
    data['request_token'] = this.token;
    return data;
  }
}
