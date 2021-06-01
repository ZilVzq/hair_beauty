import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hair_beauty/entities/service.dart';

class _ServicesProvider{

  final _firebase = FirebaseFirestore.instance;
  List<Service> servicesList = new List();
  Future<List<Service>> getServices() async {

    CollectionReference servicesSnapshot = _firebase.collection('servicios');
    var services = await servicesSnapshot.get();
    var elements = services.docs;
    for(var element in elements){
      var data = element.data();
      print(data);
      servicesList.add(Service.fromJson(data));
    }
    return servicesList;
  }
}

final servicesProvider = new _ServicesProvider();