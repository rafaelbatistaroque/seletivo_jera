// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.c.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on LoginControllerBase, Store {
  final _$loginAtualAtom = Atom(name: 'LoginControllerBase.loginAtual');

  @override
  Login get loginAtual {
    _$loginAtualAtom.context.enforceReadPolicy(_$loginAtualAtom);
    _$loginAtualAtom.reportObserved();
    return super.loginAtual;
  }

  @override
  set loginAtual(Login value) {
    _$loginAtualAtom.context.conditionallyRunInAction(() {
      super.loginAtual = value;
      _$loginAtualAtom.reportChanged();
    }, _$loginAtualAtom, name: '${_$loginAtualAtom.name}_set');
  }

  final _$qntPerfilAtom = Atom(name: 'LoginControllerBase.qntPerfil');

  @override
  int get qntPerfil {
    _$qntPerfilAtom.context.enforceReadPolicy(_$qntPerfilAtom);
    _$qntPerfilAtom.reportObserved();
    return super.qntPerfil;
  }

  @override
  set qntPerfil(int value) {
    _$qntPerfilAtom.context.conditionallyRunInAction(() {
      super.qntPerfil = value;
      _$qntPerfilAtom.reportChanged();
    }, _$qntPerfilAtom, name: '${_$qntPerfilAtom.name}_set');
  }

  final _$realizarLoginAsyncAction = AsyncAction('realizarLogin');

  @override
  Future realizarLogin(BuildContext context) {
    return _$realizarLoginAsyncAction.run(() => super.realizarLogin(context));
  }

  final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase');

  @override
  dynamic adicionarMaisUmQntPerfil() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction();
    try {
      return super.adicionarMaisUmQntPerfil();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
