
import 'package:actividad_autonoma/navigators/drawer.dart';
import 'package:flutter/material.dart';

class Listaexterna extends StatelessWidget {
  const Listaexterna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Lista Externa"),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}


