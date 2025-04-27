import 'package:flutter/material.dart';

StreamBuilder horario() {
  return StreamBuilder(
      stream: Stream.periodic(Duration(milliseconds: 1)),
      builder: (contexto, situacao_hora) {
        return Text('${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}', style: TextStyle(fontSize: 20, decoration: TextDecoration.none),);
      });
}
