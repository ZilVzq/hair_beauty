class Service{

  int serviceId;
  String nombre;
  int precio;

  Service({this.serviceId, this.nombre, this.precio});

  Map toJson() => {
    'serviceId': serviceId,
    'nombre': nombre,
    'precio': precio,
  };

  Service.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
    nombre = json['nombre'];
    precio = json['precio'];
  }

}