import 'package:flutter/material.dart';
import 'package:juego/ui/juego/widget.dart';
import 'package:juego/ui/juego/winner.dart';

class Jueguito extends StatefulWidget {
  const Jueguito({
    super.key,
  });

  @override
  State<Jueguito> createState() => _JueguitoState();
}

class _JueguitoState extends State<Jueguito> {
  // Jugador x=1, O= 2
  bool lineaGanar = false;
  int jugador = 1;
  List<List<int>> jugadas = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];

  Map icono = {0: Icons.abc, 1: Icons.close, 2: Icons.circle_outlined};
  void actualizar(int f, int c) {
    if (lineaGanar) {
      return;
    }
    // jugadas[f][c] = (jugadas[f][c] == 0) ? jugador : jugadas[f][c];
    if (jugadas[f][c] == 0) {
      jugadas[f][c] = jugador;
    } else {
      return;
    }
    jugador = (jugador == 1) ? 2 : 1;

    setState(() {});

    if (lineaGanadora()) {
      lineaGanar = true;
    }
  }

  bool lineaGanadora() {
    for (var i = 0; i < jugadas[0].length; i++) {
      if (jugadas[i][0] != 0 &&
          jugadas[i][0] == jugadas[i][1] &&
          jugadas[i][1] == jugadas[i][2]) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (jugadas[0][i] != 0 &&
          jugadas[0][i] == jugadas[1][i] &&
          jugadas[1][i] == jugadas[2][i]) {
        return true;
      }
    }

    if (jugadas[0][0] != 0 &&
        jugadas[0][0] == jugadas[1][1] &&
        jugadas[1][1] == jugadas[2][2]) {
      return true;
    }

    if (jugadas[0][2] != 0 &&
        jugadas[0][2] == jugadas[1][1] &&
        jugadas[1][1] == jugadas[2][0]) {
      return true;
    }
    return false;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Juego Tres en Linea'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      actualizar(0, 0);
                    },
                    child: Elemento(
                      estado: icono[jugadas[0][0]],
                      jugado: (jugadas[0][0] > 0),
                    )),
                GestureDetector(
                    onTap: () {
                      actualizar(0, 1);
                    },
                    child: Elemento(
                      estado: icono[jugadas[0][1]],
                      jugado: (jugadas[0][1] > 0),
                    )),
                GestureDetector(
                    onTap: () {
                      actualizar(0, 2);
                    },
                    child: Elemento(
                      estado: icono[jugadas[0][2]],
                      jugado: (jugadas[0][2] > 0),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      actualizar(1, 0);
                    },
                    child: Elemento(
                      estado: icono[jugadas[1][0]],
                      jugado: (jugadas[1][0] > 0),
                    )),
                GestureDetector(
                    onTap: () {
                      actualizar(1, 1);
                    },
                    child: Elemento(
                      estado: icono[jugadas[1][1]],
                      jugado: (jugadas[1][1] > 0),
                    )),
                GestureDetector(
                    onTap: () {
                      actualizar(1, 2);
                    },
                    child: Elemento(
                      estado: icono[jugadas[1][2]],
                      jugado: (jugadas[1][2] > 0),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      actualizar(2, 0);
                    },
                    child: Elemento(
                      estado: icono[jugadas[2][0]],
                      jugado: (jugadas[2][0] > 0),
                    )),
                GestureDetector(
                    onTap: () {
                      actualizar(2, 1);
                    },
                    child: Elemento(
                      estado: icono[jugadas[2][1]],
                      jugado: (jugadas[2][1] > 0),
                    )),
                GestureDetector(
                    onTap: () {
                      actualizar(2, 2);
                    },
                    child: Elemento(
                      estado: icono[jugadas[2][2]],
                      jugado: (jugadas[2][2] > 0),
                    )),
              ],
            ),
            const Winner()
          ],
        ));
  }
}
