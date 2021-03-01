import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/shared/preferencias_usuario.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final pref = new PreferenciasUsuario();
  await pref.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final pref = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: pref.ultimaPagina,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
