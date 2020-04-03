import 'package:flutter/material.dart';
import '../providers/combustible_providers.dart';
import '../model/combustible_model.dart';

class preciosAPI extends StatelessWidget {
  const preciosAPI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final combustibleProviders = ConsultaPrecioProviders();

    return FutureBuilder<List<Combustible>>(
      future: combustibleProviders.getPrecioCombustible(),
      builder: (context, AsyncSnapshot<List<Combustible>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10.0,
                        margin: EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          title: Text(
                            snapshot.data[i].nombre,
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            snapshot.data[i].precio,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
