import 'package:actividad_autonoma/main.dart';
import 'package:actividad_autonoma/screens/listaexterna.dart';
import 'package:actividad_autonoma/screens/listalocal.dart';
import 'package:flutter/material.dart';


class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Inicio"),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Miapliacacion())),
          ),
          ListTile(
            title: Text("Pantalla 1"),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Listalocal())),
          ),
          ListTile(
            title: Text("Pantalla 2"),
             onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Listaexterna())),
          ),
         
          
        ],
      ),
    );
  }
}