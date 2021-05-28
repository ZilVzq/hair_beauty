import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/date_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hair_beauty/entities/service.dart';
import 'package:hair_beauty/entities/worker.dart';
import 'package:hair_beauty/pages/agendar_cita_page/agendar_cita_page.dart';
import 'package:hair_beauty/pages/agendar_cita_page/widgets/reume_page.dart';
import 'package:hair_beauty/pages/login_page/login.dart';
import 'package:hair_beauty/pages/welcome_page/welcome_page.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RegistrarScreen extends StatefulWidget {
  static String id = "registrar_screen";
  @override
  _RegistrarScreenState createState() => _RegistrarScreenState();
}

class _RegistrarScreenState extends State<RegistrarScreen> {

  final _auth = FirebaseAuth.instance;
  String _nombre = '';
  String _apellido = '';
  String _telefono = '';
  String _correo = '';
  String _pass = '';
  String _pass2 = '';
  String _alias = '';
  String _generoSleccionado = 'Femenino';
  List<String> _genero = ['Femenino','Masculino'];
  String _nac = '';

  TextEditingController _inputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tRegistro'),
          backgroundColor: Color(0xff7c78f5),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearNombre(),
            Divider(),
            _crearApellido(),
            Divider(),
            _crearAlias(),
            Divider(),
            _crearGenero(),
            Divider(),
            _crearTelefono(),
            Divider(),
            _crearNac( context ),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearpass(),
            Divider(),
            _crearpass2(),
            Divider(),
            _confirmarRegistro()

          ],

        ),

    );
  }

  Widget _crearNombre() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Nombre',
          icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearApellido() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Apellido',
          icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) {
        setState(() {
          _apellido = valor;
        });
      },
    );
  }

  Widget _crearAlias() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Alias',
          icon: Icon(Icons.star)
      ),
      onChanged: (valor) {
        setState(() {
          _alias = valor;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getGeneroOpcion (){
    List<DropdownMenuItem<String>> lista = new List();
    _genero.forEach((genero) {
      lista.add(DropdownMenuItem(
        child: Text(genero),
        value: genero,
      ));
    });

    return lista;

}

  Widget _crearGenero() {
    return Row(
      children: <Widget>[
        Icon(Icons.alternate_email),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
      value: _generoSleccionado,
      items: getGeneroOpcion(),
      onChanged: (opt){
          setState(() {
            _generoSleccionado = opt;
          });
      },
    ),
        )
  ],
    );
  }

  _crearTelefono() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Telefono',
          icon: Icon(Icons.phone)
      ),
      onChanged: (valor) {
        setState(() {
          _telefono = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Correoo',
          icon: Icon(Icons.email)
      ),
      onChanged: (valor) {
        setState(() {
          _correo = valor;
        });
      },
    );
  }

  Widget _crearpass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Password',
          icon: Icon(Icons.lock)
      ),
      onChanged: (valor) {
        setState(() {
          _pass = valor;
        });
      },
    );

  }

  Widget _crearpass2() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Password',
          icon: Icon(Icons.lock)
      ),
      onChanged: (valor) {
        setState(() {
          _pass2 = valor;
        });
      },
    );

  }

  Widget _crearNac( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Fecha de Nacimiento',
          icon: Icon(Icons.calendar_today_outlined)
      ),
      onTap: () {

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
      locale: Locale('es','ES')
    );

    if (picked != null ) {
      setState(() {
        _nac = picked.toString();
        _inputController.text = _nac;
      });
    }

  }

  Widget _confirmarRegistro() {
    return GestureDetector(
        onTap: () async {
          try {
            final newUser =  await _auth.createUserWithEmailAndPassword(email: _correo, password: _pass);
            if (newUser != null) {
              Navigator.pushNamed(
                context,
                LoginScreen.id,
              );
            }
          } catch (e){
            AlertDialog(
              title: Text("Ups. Algo salió mal!"),
              content: Text("Favor de intentarlo más tarde"),
              actions: [
                CupertinoDialogAction(child: Text("OK"))
              ],
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0, bottom: 10.0),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            gradient: LinearGradient(colors: [
              Color(0xff7c78f5),
              Color(0xff7c78f5),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text("Confirmar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500)),
          padding: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
        ),

    );
  }



}
