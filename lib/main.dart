import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seletivo_jera/controllers/home_c.dart';
import 'package:seletivo_jera/controllers/perfis_c.dart';
import 'package:seletivo_jera/controllers/usuario_c.dart';
import 'package:seletivo_jera/views/login.dart';

import 'controllers/login.c.dart';
// import './view/login.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PerfilController>(create: (_) => PerfilController()),
        Provider<UsuarioController>(create: (_) => UsuarioController()),
        Provider<HomeController>(create: (_) => HomeController()),
        Provider<LoginController>(create: (_) => LoginController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
