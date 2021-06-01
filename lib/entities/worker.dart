import 'package:hair_beauty/entities/service.dart';

class Worker{

  int workerId;
  String nombre;
  String apellido;
  List<dynamic> servicios;
  Service servicio;
  int servicioId;

  Worker({this.workerId, this.nombre, this.apellido});

  Map toJson() => {
    'workerId': workerId.toString(),
    'nombre': nombre,
    'apellido': apellido,
    'servicio': servicio,
    'servicioId': servicioId,
  };

  Worker.fromJson(Map<String, dynamic> json) {
    workerId = json['workerId'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    servicios = json['servicios'];
  }

}