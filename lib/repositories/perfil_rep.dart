import 'package:shared_preferences/shared_preferences.dart';

class PerfilRep {
  deletar() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
