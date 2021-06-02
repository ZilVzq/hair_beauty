class Cita{

  String fecha;
  int idRel;
  int total;
  String user;

  Cita({this.fecha, this.idRel, this.total, this.user});

  Cita.fromJson(Map<String, dynamic> json) {
    fecha = json['fecha'];
    idRel = json['idRel'];
    total = json['total'];
    user = json['user'];
  }

}