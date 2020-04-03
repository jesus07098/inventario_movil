import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/combustible_model.dart';

class ConsultaPrecioProviders {
  String url = 'http://10.0.0.7:5000';

  Future<List<Combustible>> getPrecioCombustible() async {
    final resp = await http.get('$url/API-COMBUSTIBLE');
    final decodeData = json.decode(resp.body);

    final combustibles = new Combustibles.fromJsonList(decodeData);
    return combustibles.items;
  }

  Future<bool> registrarCombustible(nombre, precio) async {
     bool estado = true;
    try{
        final resp = await  http.post(
      '$url/combustible',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{'nombre': nombre, 'precio': precio}),
    );


    }catch(err){
      estado = false;
    }

    return estado;

  }


}
