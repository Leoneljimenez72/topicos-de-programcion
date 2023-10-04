import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login.dart';
import 'usuario&contraseña.dart';

Future<void> main() async {
  runApp(const MyApp());

  await Hive.initFlutter();
  // Abre una caja (box) llamada "users" para almacenar los datos de usuario
  Hive.registerAdapter(UserAdapter());
  final usersBox = await Hive.openBox('users');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.values[4],
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            child: Column(children: [
          Text(
            'PUNTO DE VENTA',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset('assets/venta.png'),
          SizedBox(
            height: 40,
          ),
          FloatingActionButton.extended(
              backgroundColor: Colors.blueGrey,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ));
              },
              label: Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login', style: TextStyle(fontSize: 30)),
                  ],
                ),
              ))
        ])),
      ],
    ));
  }
}
