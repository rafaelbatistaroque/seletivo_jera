// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_c.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioController on UsuarioControllerBase, Store {
  final _$nomeUsuarioAtom = Atom(name: 'UsuarioControllerBase.nomeUsuario');

  @override
  String get nomeUsuario {
    _$nomeUsuarioAtom.context.enforceReadPolicy(_$nomeUsuarioAtom);
    _$nomeUsuarioAtom.reportObserved();
    return super.nomeUsuario;
  }

  @override
  set nomeUsuario(String value) {
    _$nomeUsuarioAtom.context.conditionallyRunInAction(() {
      super.nomeUsuario = value;
      _$nomeUsuarioAtom.reportChanged();
    }, _$nomeUsuarioAtom, name: '${_$nomeUsuarioAtom.name}_set');
  }

  final _$obterDetalhesDeUsuarioAsyncAction =
      AsyncAction('obterDetalhesDeUsuario');

  @override
  Future obterDetalhesDeUsuario(Usuario usuarioLogado) {
    return _$obterDetalhesDeUsuarioAsyncAction
        .run(() => super.obterDetalhesDeUsuario(usuarioLogado));
  }
}
