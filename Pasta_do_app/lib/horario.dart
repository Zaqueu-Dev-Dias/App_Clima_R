import 'package:app_clima_oficial/responsividade.dart';
import 'package:flutter/material.dart';

import 'Cor_horario.dart';

StreamBuilder horario(String horar){
  print('hhhhh');
  int hora = int.parse(horar.substring(11,13));
  int minuto = int.parse(horar.substring(14,16));
  int segundos = DateTime.now().second;
  return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1)),
      builder: (contexto, situacao_hora) {
        segundos += 1;
        if(hora == 24){
            hora = 0;
        }else if(minuto == 60){
              minuto = 0;
              hora += 1;
        }else if(segundos == 60){
            minuto += 1;
            segundos = 0;
        }
        return Text(
          '${hora}:${minuto}:${segundos}',
          style: TextStyle(
              fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(contexto).size.width, alturaX: MediaQuery.of(contexto).size.height, tamanhofixo: 20),
              decoration: TextDecoration.none,
              color: cor_horario(horar.substring(11,13))[1]),
        );
      });}
