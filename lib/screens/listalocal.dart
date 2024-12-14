import 'dart:convert';
import 'package:flutter/material.dart';

class Listalocal extends StatelessWidget {
  const Listalocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista Local"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "LISTA LOCAL",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: lista2(context)), // Aseguramos la expansión
        ],
      ),
    );
  }
}

// Leer datos desde un archivo JSON local
Future<List<dynamic>> leerJsonLocal(BuildContext context) async {
  final String jsonString =
      await DefaultAssetBundle.of(context).loadString("assets/data/info.json");
  return json.decode(jsonString);
}

// Construir lista basada en el JSON

Widget lista2(BuildContext context) {
  return FutureBuilder(
    future: leerJsonLocal(context),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                   
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item['image'],
                        height: 200,
                      ),
                    ),                    
                    Text(
                      item['description'],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
