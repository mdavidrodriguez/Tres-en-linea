import 'package:flutter/material.dart';

class Winner extends StatelessWidget {
  const Winner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        width: 400,
        height: 100,
        decoration: const BoxDecoration(color: Colors.blue),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Ganador(
              icon: Icons.close_outlined,
              texto: Text(
                'Jugador 1',
                style: TextStyle(fontSize: 20),
              ),
            ),
            _Ganador(
              icon: Icons.circle_outlined,
              texto: Text(
                'Jugador 2',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Ganador extends StatelessWidget {
  const _Ganador({required this.icon, required this.texto});
  final IconData icon;
  final Text texto;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        texto,
        Icon(
          icon,
          size: 50,
        ),
      ],
    );
  }
}
