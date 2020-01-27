import 'package:mobx/mobx.dart';
import 'package:seletivo_jera/models/usuario_m.dart';
import 'package:seletivo_jera/repositories/usuario_rep.dart';
part 'usuario_c.g.dart';

class UsuarioController = UsuarioControllerBase with _$UsuarioController;

abstract class UsuarioControllerBase with Store {
  @observable
  String nomeUsuario;

  UsuarioRep _usuarioRep = UsuarioRep();

  @action
  obterDetalhesDeUsuario(Usuario usuarioLogado) async {
    Map<String, dynamic> resposta =
        await _usuarioRep.obterDetalhesUsuario(usuarioLogado.idSecao);
    nomeUsuario = resposta['name'];
  }
}
