import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hair_beauty/entities/cita.dart';
import 'package:hair_beauty/entities/rel_serv_worker.dart';
import 'package:hair_beauty/entities/service.dart';
import 'package:hair_beauty/entities/worker.dart';
import 'package:hair_beauty/entities/worker_service.dart';
import 'package:hair_beauty/providers/services_provider.dart';
import 'package:hair_beauty/providers/workers_provider.dart';

class _CitasProvider{

  final _firebase = FirebaseFirestore.instance;
  List<int> referencesList = [];

  Future<int> getNextIdRef() async {
    int nextId = 1;
    CollectionReference citasSnapshot = _firebase.collection('citas');
    var citas = await citasSnapshot.orderBy("idRel").limitToLast(1).get();
    var elements = citas.docs;
    for(var element in elements){
      var data = element.data();
      print(data);
      Cita cita = Cita.fromJson(data);
      nextId = cita.idRel + 1;
    }
    return nextId;
  }

  Future<List<WorkerService>> getCitasByEmail(String email) async {
    List<WorkerService> workersService = new List();
    List<Worker> workers = workersProvider.workersList;
    List<Service> services = servicesProvider.servicesList;
    CollectionReference citasSnapshot = _firebase.collection('citas');
    var citasDoc = await citasSnapshot.where("user", isEqualTo: email).get();
    var citasList = citasDoc.docs;
    for(var cita in citasList){
      var citaElementJson = cita.data();
      Cita citaObject = Cita.fromJson(citaElementJson);
      if(!referencesList.contains(citaObject.idRel)){
        referencesList.add(citaObject.idRel);
      }
      CollectionReference relSerworkerSnapshot = _firebase.collection('rel_serv_worker');
      var relSerworkerDoc = await relSerworkerSnapshot.where("idRel", isEqualTo: citaObject.idRel).get();
      var relSerworkerList = relSerworkerDoc.docs;
      for(var relacion in relSerworkerList){
        var relacionJson = relacion.data();
        RelServWorker relObject = RelServWorker.fromJson(relacionJson);
        Worker workerElement = workers.firstWhere((element) => element.workerId == relObject.empleado);
        Service serviceElement = services.firstWhere((element) => element.serviceId == relObject.servicio);
        workersService.add(new WorkerService(idRef: citaObject.idRel, worker: workerElement, service: serviceElement, cita: citaObject));
      }
    }
    return workersService;
  }
}

final citasProvider = new _CitasProvider();