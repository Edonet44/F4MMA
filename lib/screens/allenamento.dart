import 'package:flutter/material.dart';

import '../model/cl_palestre.dart';

class Allenamento extends StatelessWidget {
  const Allenamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView(
        children: PalestraIterable()
            .map((Palestra) => ListTile(
                  title: Text(Palestra.nome),
                  subtitle: Text(
                      "Luogo: ${Palestra.luogo}, Costo: ${Palestra.costo}"),
                ))
            .toList(),
      ),
    );
  }
}
