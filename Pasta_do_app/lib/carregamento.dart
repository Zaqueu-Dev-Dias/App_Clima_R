import 'package:flutter/material.dart';

import 'Tela_principal.dart';
import 'api_clima.dart';
import 'lottiefiles_carregamento.dart';

class Carregamento extends StatefulWidget {
  const Carregamento({super.key});

  @override
  State<Carregamento> createState() => _CarregamentoState();
}

class _CarregamentoState extends State<Carregamento> {
  String local = 'Guarulhos';
  @override
  Widget build(BuildContext context) {
    void atualizar([String? locali]){
      if(locali != null){
        local = locali;
      }
      setState(() {});
    }
    return FutureBuilder(future: api_clima(local), builder: (contexto, situacao_dados){
      if(situacao_dados.hasData){
        if(situacao_dados.data == 'Local não encontrado'){
          return Container(color: Colors.white,child: Center(child: Text('${situacao_dados.data}', style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),)));
        }else if(situacao_dados.data == 'erro no servidor'){
          return Container(child: Center(child: Text('${situacao_dados.data}', style: TextStyle(fontSize: 20, color: Colors.black),)));
        }else if(situacao_dados.data == 'sem internet'){
          return Container(child: Center(child: Text('${situacao_dados.data}', style: TextStyle(fontSize: 20, color: Colors.black),)));
        }else {
          return Tela_Principal(dados: situacao_dados.data, func_atualizar: atualizar,);
        }
      }else if(situacao_dados.hasError){
        return Text('Erro no app! Por favor, contatar ao desenvolvedor');
      }else{
        return carregando();
      }
    });
  }
}
