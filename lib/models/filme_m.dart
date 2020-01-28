class Filme {
  int idFilme;
  String title;
  String poster;
  String movieOrTv;
  int idMovieOrTv;
  bool favorito;
  bool assistido;

  Filme(
      {this.idFilme,
      this.title,
      this.poster,
      this.movieOrTv = 'movie',
      this.idMovieOrTv,
      this.favorito = false,
      this.assistido = false});

  Filme.fromJson(Map<String, dynamic> json) {
    idFilme = json['id'];
    title = json['title'];
    poster = json['poster_path'];
    movieOrTv = json['media_type'];
    idMovieOrTv = json['media_id'];
    favorito = json['favorite'];
    assistido = json['watchlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idFilme;
    data['title'] = this.title;
    data['poster_path'] = this.poster;
    data['media_type'] = this.movieOrTv;
    data['media_id'] = this.idMovieOrTv;
    data['favorite'] = this.favorito;
    data['watchlist'] = this.assistido;
    return data;
  }
}
