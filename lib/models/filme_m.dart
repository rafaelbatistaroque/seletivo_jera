class Filme {
  String title;
  bool favorito;
  bool assistido;

  Filme({this.title, this.favorito, this.assistido});

  Filme.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    favorito = json['favorito'];
    assistido = json['assistido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['favorito'] = this.favorito;
    data['assistido'] = this.assistido;
    return data;
  }
}
