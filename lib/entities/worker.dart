import 'package:hair_beauty/entities/service.dart';

class Worker{

  int workerId;
  String nombre;
  String apellido;
  List<Service> servicios;

  Worker({this.workerId, this.nombre, this.apellido});

  Map toJson() => {
    'workerId': workerId.toString(),
    'nombre': nombre,
    'apellido': apellido,
    'nombreCompleto': nombre + ' ' + apellido
  };

}