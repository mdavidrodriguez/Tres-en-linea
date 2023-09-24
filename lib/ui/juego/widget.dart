import 'package:flutter/material.dart';

class Elemento extends StatelessWidget {
  const Elemento({
    super.key, required this.estado, required this.jugado
  });

  final IconData estado;
  final bool jugado;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.2,
        height:  (MediaQuery.of(context).size.width > 540) ? MediaQuery.of(context).size.height*0.3: MediaQuery.of(context).size.height*0.1,
        color: Colors.amber,
        child: (jugado)? Icon(estado,size: MediaQuery.of(context).size.width*0.2,color: Colors.white,): const Text(""),
      ),
    );
  }
}