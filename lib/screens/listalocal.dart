

import 'package:actividad_autonoma/navigators/drawer.dart';
import 'package:flutter/material.dart';

class Listalocal extends StatelessWidget {
  const Listalocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Lista local"),
        ],
      ),
      drawer: MiDrawer(),
    );
  }
}