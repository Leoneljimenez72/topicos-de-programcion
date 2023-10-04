import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:puntoventa/usuario&contrase%C3%B1a.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usuario = TextEditingController();
  TextEditingController _contrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildUsuario();
  }
}

Widget _buildUsuario() {
  Hive.openBox('users');
  var usersBox = Hive.box('users');
  TextEditingController _usuario = TextEditingController();
  TextEditingController _contrasena = TextEditingController();
  if (usersBox.isEmpty) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              alignment: Alignment.center,
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/venta.png'),
                        fit: BoxFit.values[1]),
                    color: Colors.orange[100],
                  ),
                  child: Text('PUNTO DE VENTA',
                      style: GoogleFonts.pacifico(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.white)),
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),

                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white),
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Registro Usuario',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: _usuario,
                          decoration: InputDecoration(
                              label: Text('Usuario',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )))),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: _contrasena,
                          decoration: InputDecoration(
                              label: Text('Contraseña',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton.extended(
                    backgroundColor: Colors.blueGrey,
                    onPressed: () {
                      final user = User(
                          username: _usuario.text, password: _contrasena.text);
                      final usersBox = Hive.box('users');
                      if (_usuario.text.isEmpty || _contrasena.text.isEmpty) {
                        print('necesitas llenar ambos campos');
                      } else {
                        usersBox.add(user);
                        print(usersBox.getAt(0));
                      }
                    },
                    label: Container(
                        alignment: Alignment.center,
                        width: 200,
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 30,
                            ))))
              ])),
        ],
      ),
    );
  } else {
    return Scaffold();
  }
}
