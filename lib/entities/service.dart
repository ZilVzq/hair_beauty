import 'package:hair_beauty/entities/worker.dart';

class Service{

  int serviceId;
  String nombre;
  double precio;
  List<Worker> workers;

  Service({this.serviceId, this.nombre, this.precio});

  Map toJson() => {
    'serviceId': serviceId,
    'nombre': nombre,
    'precio': precio,
  };

}