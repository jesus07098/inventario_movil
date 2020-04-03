import 'package:day14/pages/consulta_precios.dart';
import 'package:day14/pages/login.dart';
import 'package:day14/pages/tanques.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagina=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          "Control de Inventario",
          style: TextStyle(),
        ),
      ),
      body: _body(pagina),
     drawer: _crearMenu(),
          );
        }
      
        Drawer _crearMenu() {
          return Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Container(),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/fondoDraw.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.view_array, color: Colors.black,),
                  title: Text(
                    'Tanques',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onTap: (){
                    setState(() {
                      pagina=1;
                    });
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.red, thickness: 1.0,),
                ListTile(
                  leading: Icon(Icons.monetization_on, color: Colors.black,),
                  title: Text(
                    'Precio Combustibles',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    
                  ),
                  onTap: (){
                    setState(() {
                      pagina = 2;
                    });
                     Navigator.pop(context);
                  },
                ),
                 Divider(color: Colors.red, thickness: 1.0,),
              ],
            ),
          );
        }
      
        _body(int pagina) {
          switch (pagina) {
           
            case 1 : return Tanques();
            case 2 : return preciosAPI();
              
             
            default:
          }
        }
}
