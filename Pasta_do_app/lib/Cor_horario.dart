import 'package:flutter/material.dart';

List<dynamic> cor_horario(String hora){
  if(int.parse(hora) >= 6 && int.parse(hora) < 18){
    return [BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.white], begin: Alignment.topLeft, end: Alignment.bottomCenter)), Colors.black];
  }else if(int.parse(hora) >= 18 || int.parse(hora) <= 4){
    return [BoxDecoration(gradient: LinearGradient(colors: [Colors.black, Colors.white], begin: Alignment.topLeft, end: Alignment.bottomCenter)), Colors.white];
  }else{
    return [BoxDecoration(gradient: LinearGradient(colors: [Colors.deepOrangeAccent, Colors.white], begin: Alignment.topLeft, end: Alignment.bottomCenter)), Colors.grey.shade700];
  }
}