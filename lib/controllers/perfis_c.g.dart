// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfis_c.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on PerfilControllerBase, Store {
  final _$listaUsuarioAtom = Atom(name: 'PerfilControllerBase.listaUsuario');

  @override
  ObservableList<dynamic> get listaUsuario {
    _$listaUsuarioAtom.context.enforceReadPolicy(_$listaUsuarioAtom);
    _$listaUsuarioAtom.reportObserved();
    return super.listaUsuario;
  }

  @override
  set listaUsuario(ObservableList<dynamic> value) {
    _$listaUsuarioAtom.context.conditionallyRunInAction(() {
      super.listaUsuario = value;
      _$listaUsuarioAtom.reportChanged();
    }, _$listaUsuarioAtom, name: '${_$listaUsuarioAtom.name}_set');
  }

  final _$deletarDadosAsyncAction = AsyncAction('deletarDados');

  @override
  Future deletarDados() {
    return _$deletarDadosAsyncAction.run(() => super.deletarDados());
  }

  final _$PerfilControllerBaseActionController =
      ActionController(name: 'PerfilControllerBase');

  @override
  dynamic adicionarNovoPerfil(
      {String nome = 'User Padrão',
      String email,
      String senha,
      String dataNasc}) {
    final _$actionInfo = _$PerfilControllerBaseActionController.startAction();
    try {
      return super.adicionarNovoPerfil(
          nome: nome, email: email, senha: senha, dataNasc: dataNasc);
    } finally {
      _$PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
