import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  final pref = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    pref.ultimaPagina = SettingsPage.routeName;
    _genero = pref.genero;
    _colorSecundario = pref.colorSecundario;
    _textController = new TextEditingController(text: pref.nombreUsuario);
  }

  _setSelectedRadio(int valor) {
    pref.genero = valor;

    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (pref.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  pref.colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el teléfono'),
                onChanged: (value) {
                  pref.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}
