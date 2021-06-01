import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDataProvider extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  UserDataProvider();

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<QuerySnapshot>(
      future: users.where("email", isEqualTo: _auth.currentUser.email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && snapshot.data.size < 1) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          var usersData = snapshot.data.docs;
          var currentUser = usersData[0];
          Map<String, dynamic> data = currentUser.data();
          return Text("Bienvenid@: ${data['alias']}");
        }

        return Text("loading");
      },
    );
  }
}