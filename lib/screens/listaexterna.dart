
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:actividad_autonoma/navigators/drawer.dart'; // Conservamos tu Drawer personalizado

class Listaexterna extends StatelessWidget {
  const Listaexterna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista Externa"),
      ),
      body: Column(
        children: [
          const Text(
            "LISTA EXTERNA",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: lista("https://jritsqmet.github.io/web-api/crash.json"),
          ),
        ],
      ),
      drawer: MiDrawer(), 
    );
  }
}

Future<List<dynamic>> leerJsonExterno(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception("Error al cargar datos");
  }
}

// Widget para construir la lista
Widget lista(String url) {
  return FutureBuilder<List<dynamic>>(
    future: leerJsonExterno(url),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text("Error: ${snapshot.error}"));
      } else if (snapshot.hasData) {
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'] ?? 'Sin nombre',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Image.network(
                      item['image'] ?? '',
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Text("Error al cargar imagen"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return const Center(child: Text("Datos no encontrados"));
      }
    },
  );
}

