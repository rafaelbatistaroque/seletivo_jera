import 'package:mobx/mobx.dart';
import 'package:seletivo_jera/models/filme_m.dart';
import 'package:seletivo_jera/repositories/home_rep.dart';
part 'home_c.g.dart';

class HomeController = HomeControlerBase with _$HomeController;

abstract class HomeControlerBase with Store {
  HomeRep _homeRepositorio;

  @observable
  ObservableList<dynamic> filmes;

  HomeControlerBase() {
    _homeRepositorio = HomeRep();
    filmes = ObservableList<dynamic>().asObservable();
  }

  @action
  obterListadeFilmes() async {
    await _homeRepositorio.obterListaFilmesPopulares().then((listaFilme) {
      this.filmes = ObservableList.of(listaFilme);
    });
  }

  @action
  pesquisarFilmes(String query) async {
    await _homeRepositorio.pesquisarListaFilmes(query).then((listaFilme) {
      this.filmes = ObservableList.of(listaFilme);
    });
  }

  @action
  marcarComoFavorito(String idSecao, Filme filme) async {
    await _homeRepositorio.marcarFilmeComoFavorito(idSecao, filme);
  }
}
