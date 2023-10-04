import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Punto de Venta',
              style: GoogleFonts.pacifico(fontSize: 40),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                print('Ventas');
              },
              child: Text(
                'Ventas',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple),
              )),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                print('Inventario');
              },
              child: Text(
                'Inventario',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple),
              )),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                print('Estadisticas');
              },
              child: Text(
                'Estadisticas',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.purple),
              ))
        ],
      ),
    );
  }
}
