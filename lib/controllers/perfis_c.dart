import 'package:mobx/mobx.dart';
import 'package:seletivo_jera/models/usuario_m.dart';
import 'package:seletivo_jera/repositories/perfil_rep.dart';
part 'perfis_c.g.dart';

class PerfilController = PerfilControllerBase with _$PerfilController;

abstract class PerfilControllerBase with Store {
  PerfilRep _perfilRepositorio;

  PerfilControllerBase() {
    _perfilRepositorio = PerfilRep();

    adicionarNovoPerfil();
  }

  @observable
  var listaUsuario = ObservableList<dynamic>().asObservable();

  @action
  adicionarNovoPerfil({
    String nome = 'User Padrão',
    String email,
    String senha,
    String dataNasc,
  }) =>
      listaUsuario.add(
        Usuario(
            nome: nome,
            email: email,
            senha: senha,
            dataNasc: dataNasc,
            idSecao: '123'),
      );

  @action
  deletarDados() async {
    await _perfilRepositorio.deletar();
  }
}
