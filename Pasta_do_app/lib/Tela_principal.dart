import 'package:flutter/material.dart';

import 'horario.dart';

class Tela_Principal extends StatelessWidget {
  const Tela_Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 340,
                child: Material(
                  color: Colors.transparent,
                    child: TextField(
                  decoration: InputDecoration(
                      label: Row(
                        children: [
                          Icon(Icons.search),
                          Text('pesquisar local'),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                          borderRadius: BorderRadius.circular(15))),
                )),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 10, top: 20),
                  child: Text(
                    '26/04/2025',
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60, left: 10, top: 20),
                  child: horario(),
                ),
              ],
            ),
            Center(
              child: Text(
                'Emoji',
                style: TextStyle(fontSize: 60, decoration: TextDecoration.none),
              ),
            ),
            Center(
              child: Text(
                '25°C',
                style: TextStyle(fontSize: 100, decoration: TextDecoration.none),
              ),
            ),
            Center(
                child: Text(
              'Guarulhos',
              style: TextStyle(fontSize: 20, decoration: TextDecoration.none),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Humidade:',
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Vento:',
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Céu:',
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Continente:',
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
