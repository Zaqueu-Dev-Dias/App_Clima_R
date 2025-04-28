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
  List<String> local = ['Guarulhos', 'nenhum país'];
  @override
  Widget build(BuildContext context) {
    void atualizar([String? locali]){
      if(locali != null){
        local[1] = local[0];
        local[0] = locali;
      }
      setState(() {});
    }
    return FutureBuilder(future: api_clima(local[0]), builder: (contexto, situacao_dados){
      if(situacao_dados.hasData){
        if(situacao_dados.data == 'Local não encontrado'){
          return Container(color: Colors.white,child: Center(child: GestureDetector(onTap: (){atualizar(local[1]);},child: Text('${situacao_dados.data}', style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none),))));
        }else if(situacao_dados.data == 'erro no servidor'){
          return Container(child: Center(child: Text('${situacao_dados.data}', style: TextStyle(fontSize: 20, color: Colors.black),)));
        }else if(situacao_dados.data == 'Sem internet! Por favor, tente conectar a intenet!'){
          return Container(child: Center(child: Text('${situacao_dados.data}', style: TextStyle(fontSize: 20, color: Colors.black),)));
        }else {
          return Tela_Principal(dados: situacao_dados.data, func_atualizar: atualizar,);
        }
      }else if(situacao_dados.hasError){
        return Container(color: Colors.white,child: Center(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(onTap: atualizar,child: Text('Você não está conectado a internet!', style: TextStyle(fontSize: 20, decoration: TextDecoration.none, color: Colors.black),)),
        )));
      }else{
        return carregando();
      }
    });
  }
}
