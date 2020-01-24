import 'package:flutter_test/flutter_test.dart';
import 'package:seletivo_jera/services/dio_singleton.dart';

main() {
  DioSingleton instancia1 = DioSingleton();
  DioSingleton instancia2 = DioSingleton();

  group('Testes de instancia', () {
    test('Deve passar se instancia1 igual instancia2 de ApiServices', () {
      expect(instancia1, instancia2);
    });
    test('Deve passa se existir única instacia do Dio', () {
      expect(instancia1.dio, instancia2.dio);
    });
  });
}
