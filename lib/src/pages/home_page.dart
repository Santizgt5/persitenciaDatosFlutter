import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared/preferencias_usuario.dart';

import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final pref = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    pref.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (pref.colorSecundario) ? Colors.teal : Colors.blue ,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${pref.colorSecundario}'),
          Divider(),
          Text('Genero: ${pref.genero}'),
          Divider(),
          Text('Nombre de usuario: ${pref.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
