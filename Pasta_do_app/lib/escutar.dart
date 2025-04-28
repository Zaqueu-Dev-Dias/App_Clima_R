import 'package:flutter/material.dart';

StreamBuilder escutar(void Function(String?) func, String hora){
  int dia = 0;
  int noite = 0;
  int virada = 0;
  return StreamBuilder(stream: Stream.periodic(Duration(milliseconds: 1)), builder: (contexto, dado){
    if(int.parse(hora) >= 6 && dia == 0){
      dia = 1;
      func(null);
    }else if(int.parse(hora) >= 18 && noite == 0){
      noite = 1;
      func(null);
    }else if((int.parse(hora)>=5 && int.parse(hora) < 6) && virada == 0){
      virada = 1;
      func(null);
    }
    return Container();
  });
}