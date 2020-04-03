import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/combustible_model.dart';

class ConsultaPrecioProviders{
  String url = 'http://10.0.0.7:3000/API-COMBUSTIBLE'; 

 Future<List<Combustible>> getPrecioCombustible() async{
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    
    final combustibles = new Combustibles.fromJsonList(decodeData);
    return combustibles.items;
  }
}