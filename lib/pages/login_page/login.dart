import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hair_beauty/pages/registrar_page/registrar_page.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
            width: size.width * 00.85,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Acceso',
                    style: GoogleFonts.pacifico(
                        color: Color(0xff7c78f5), fontSize: 25.0)),
                SizedBox(height: 30.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 40.0),
                _crearBoton()
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Olvido la Contraseña?'),
          SizedBox(
            height: 30,
          ),
          _crearBotonLogin(),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      color: Color(0xff7c78f5),
      // decoration: BoxDecoration(
      //  gradient: LinearGradient(
      //colors: <Color>[
      //  color: Color(0xff7c78f5),
      //]
      //)
      //),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.account_circle, color: Colors.white, size: 100.0),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text('Estetica de Mersy\'s',
                  style: GoogleFonts.pacifico(
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontSize: 30.0))
            ],
          ),
        )
      ],
    );
  }

  Widget _crearEmail() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email, color: Color(0xff7c78f5)),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electronico',
              counterText: snapshot.data,
            ),
            onChanged: (value) {
              _email = value;
            },
          ),
        );
      },
    );
  }

  Widget _crearPassword() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline_rounded, color: Color(0xff7c78f5)),
              labelText: 'Contraseña',
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
        );
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        child: Text('Ingresar',
            style: GoogleFonts.pacifico(color: Colors.white, fontSize: 20.0)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 0.0,
      color: Color(0xff7c78f5),
      textColor: Colors.white,
      onPressed: () async {
        try {
          final currentUser = await _auth.signInWithEmailAndPassword(
              email: _email, password: _password);
          if (currentUser != null) {
            Navigator.pushNamed(
              context,
              WelcomeScreen.id,
            );
          } else {
            AlertDialog(
              title: Text("Credenciales incorrectas"),
              content: Text("Usuario o contraseña incorrectas"),
              actions: [
                CupertinoDialogAction(child: Text("OK"))
              ],
            );
          }
        } catch (e) {
          print(e);
          AlertDialog(
            title: Text("Ups. Algo salió mal!"),
            content: Text("Favor de intentarlo más tarde"),
            actions: [
              CupertinoDialogAction(child: Text("OK"))
            ],
          );
        }
      },
    );
  }

  Widget _crearBotonLogin() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
        child: Text('Crear Cuenta',
            style: GoogleFonts.pacifico(color: Colors.white, fontSize: 20.0)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 0.0,
      color: Color(0xff7c78f5),
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(
          context,
          RegistrarScreen.id,
        );
      },
    );
  }
}
