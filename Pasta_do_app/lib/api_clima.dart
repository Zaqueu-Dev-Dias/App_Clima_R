import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<dynamic> api_clima(String localidade)async{
  var url = Uri.parse('http://api.weatherapi.com/v1/current.json?key=fc4fdfdefdcb4165b5851943251203&q=${localidade}&aqi=no&lang=pt');
  var resposta = await http.get(url);
  try{
    print('---${resposta.statusCode}---');
    if(resposta.statusCode == 200){
      return jsonDecode(utf8.decode(resposta.bodyBytes));
    }else if(resposta.statusCode == 400){
      print('erro no servidor');
      return 'Local não encontrado';
    }else{
      return 'erro no servidor';
    }
  } on SocketException{
    print('sem internet');
    return 'sem internet';
  }
}