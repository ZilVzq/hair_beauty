import 'package:hair_beauty/entities/service.dart';

class RelServWorker{

  int empleado;
  int idRel;
  int servicio;

  RelServWorker({this.empleado, this.idRel, this.servicio});

  RelServWorker.fromJson(Map<String, dynamic> json) {
    empleado = json['empleado'];
    idRel = json['idRel'];
    servicio = json['servicio'];
  }

}