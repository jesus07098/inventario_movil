class Combustibles {
  List<Combustible> items = new List();
  Combustibles();

  Combustibles.fromJsonList(List<dynamic> listJson) {
    if (listJson == null) return;

    for (var item in listJson) {
      final combustible = Combustible.fromJson(item);
      items.add(combustible);
    }
  }
}

class Combustible {
  String nombre;
  String precio;

  Combustible({
    this.nombre,
    this.precio,
  });

  factory Combustible.fromJson(Map<String, dynamic> json) {
    return Combustible(
      nombre: json['nombre'],
      precio: json['precio'],
    );
  }
}
