
import 'package:actividad_autonoma/navigators/drawer.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Miapliacacion());
}

class Miapliacacion extends StatelessWidget {
  const Miapliacacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      drawer: MiDrawer(),
    );
  }
}