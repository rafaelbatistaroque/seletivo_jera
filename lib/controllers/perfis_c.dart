import 'package:mobx/mobx.dart';
import 'package:seletivo_jera/models/login_m.dart';
import 'package:seletivo_jera/models/usuario_m.dart';
import 'package:seletivo_jera/repositories/perfil_rep.dart';
part 'perfis_c.g.dart';

class PerfilController = PerfilControllerBase with _$PerfilController;

abstract class PerfilControllerBase with Store {
  Usuario usuarioPadrao;
  PerfilRep _perfilRepositorio;

  PerfilControllerBase() {
    _perfilRepositorio = PerfilRep();
    usuarioPadrao = Usuario(
        nome: 'User Padrão', dataNasc: '', email: '', senha: '', idSecao: '0');
  }

  @observable
  ObservableList<dynamic> listaUsuario = [].asObservable();

  @action
  carregarPerfilPadrao(Login usuarioAtual) async {
    await _perfilRepositorio.obterIdSecao(usuarioAtual.token).then((resposta) {
      if (resposta != null) {
        this.usuarioPadrao.idSecao = resposta;
        listaUsuario.add(this.usuarioPadrao);
      }
      return null;
    });
  }

  @action
  adicionarNovoPerfil(
      String nome, String email, String senha, String dataNasc) {
    final novoUsuario = Usuario(
        nome: nome,
        email: email,
        senha: senha,
        dataNasc: dataNasc,
        idSecao: '123');
    listaUsuario.add(novoUsuario);
  }

  @action
  deletarDados() async {
    await _perfilRepositorio.deletar();
  }
}
