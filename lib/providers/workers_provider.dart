import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hair_beauty/entities/worker.dart';

class _WorkersProvider{

  final _firebase = FirebaseFirestore.instance;
  List<Worker> workersList = new List();
  Future<List<Worker>> getWorkers() async {

    CollectionReference workersSnapshot = _firebase.collection('empleados');
    var workers = await workersSnapshot.get();
    var elements = workers.docs;
    for(var element in elements){
      var data = element.data();
      print(data);
      workersList.add(Worker.fromJson(data));
    }
    return workersList;
  }
}

final workersProvider = new _WorkersProvider();