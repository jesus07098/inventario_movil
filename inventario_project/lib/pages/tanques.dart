import 'package:flutter/material.dart';
import '../providers/combustible_providers.dart';

class Tanques extends StatefulWidget {
  const Tanques({Key key}) : super(key: key);

  @override
  _TanquesState createState() => _TanquesState();
}

class _TanquesState extends State<Tanques> {
  String id;

  final provider = ConsultaPrecioProviders();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _crearInput(),
        RaisedButton(
          onPressed: () async {
           bool valor = await provider.registrarCombustible('hghg', id);
            _dialog(context, valor);
          },
          child: Text(
            'Guardar',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red[900],
        ),
      ],
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras 0'),
        hintText: 'id del Tanque',
        labelText: 'id',
        icon: Icon(Icons.format_list_numbered),
      ),
      onChanged: (valor) {
        id = valor;
      },
    );
  }

 _dialog(BuildContext context, bool error) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: !error ? Text('Datos registrados'): Text('Datos no registrados'),
           content: !error ? Text('Datos registrados correctamente'): Text('Error, datos no registrados'),
          );
        });
  }
}
