import 'package:flutter_test/flutter_test.dart';
import 'package:seletivo_jera/models/login_m.dart';
import 'package:seletivo_jera/repositories/login_rep.dart';

main() {
  LoginRep loginRep = new LoginRep();
  Login usuario = new Login();
  usuario.usuario = 'maranata';
  usuario.senha = '010586kenosis';

  group('Teste de login', () {
    test("Deve passar se requisição retornar Token de acesso", () {});
  });
}
