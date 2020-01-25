import 'package:flutter/material.dart';
import 'package:seletivo_jera/models/login_m.dart';

class Home extends StatefulWidget {
  final Login userLogado;
  Home(this.userLogado);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: Text('Olá ${widget.userLogado.usuario}')));
  }
}
