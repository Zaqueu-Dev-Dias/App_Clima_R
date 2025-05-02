import 'package:app_clima_oficial/responsividade.dart';
import 'package:flutter/material.dart';
import 'Cor_horario.dart';
import 'escutar.dart';
import 'horario.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Tela_Principal extends StatelessWidget {
  var dados;
  void Function(String?) func_atualizar;
  TextEditingController dados_input = TextEditingController();
  Tela_Principal({super.key, required this.dados, required this.func_atualizar});

  @override
  Widget build(BuildContext context) {
    print('TAMANHO LARGURA ${MediaQuery.of(context).size.width}');
    print('TAMANHO ALTURA: ${MediaQuery.of(context).size.height}');
    print(dados);
    return Stack(
      children: [
        escutar(func_atualizar, dados['location']['localtime'].substring(11,13)),
        Container(
          decoration: cor_horario(dados['location']['localtime'].substring(11,13))[0],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 340),//340
                child: Material(
                  color: Colors.transparent,
                    child: TextField(
                      style: TextStyle(color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
                      controller: dados_input,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (texto){
                    if (dados_input.text == '') {
                    } else {
                      func_atualizar(dados_input.text);
                    }
                  },
                  decoration: InputDecoration(
                      label: Row(
                        children: [
                          Icon(Icons.search, color: cor_horario(dados['location']['localtime'].substring(11,13))[1],),
                          Text(' pesquisar local', style: TextStyle(color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
                          borderRadius: BorderRadius.circular(15))),
                )),
              ),
            ),
            Row(
              children: [
                Padding(                               //60      //10      //20
                  padding: EdgeInsets.only(
                      left: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 60),
                      right: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 10),
                      top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 20)),
                  child: Text(
                    '${dados['location']['localtime'].substring(8,10)}/${dados['location']['localtime'].substring(5,7)}/${dados['location']['localtime'].substring(0,4)}',
                    style: TextStyle(
                        fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 20) , decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
                  ),
                ),
                Padding(                               //60       //10     //20
                  padding:  EdgeInsets.only(
                      right: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 60),
                      left: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 10),
                      top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 20)),
                  child: horario(dados['location']['localtime']),
                ),
              ],
            ),
            Center(
              child: Image.network('http:${dados['current']['condition']['icon']}').
                animate(onPlay: (controle){controle.repeat();}).
                  moveX(end: 15, begin: -25, curve: Curves.easeInOut, duration: 5000.ms)
                  .then()
                  .moveX(end: -25, begin: 15, curve: Curves.easeInOut),
            )
            ,
            Center(
              child: Text('${dados['current']['temp_c']}'.split('.')[0]+'°C',
                style: TextStyle(fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 100) , decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
              ),
            ),
            Center(
                child: Text('${dados['location']['name']}',
              style: TextStyle(fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 20), decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
            )),
            Padding(
              padding: EdgeInsets.only(top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0),
                        right:  ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        bottom: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0)),
                    child: Text('Humidade: ${dados['current']['humidity']}%',
                      style: TextStyle(
                          fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 20), decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                        left: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0),
                        right:  ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        bottom: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0)),
                    child: Text('Vento: ${dados['current']['wind_kph']}'.split('.')[0]+'Km/h',
                      style: TextStyle(
                          fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 20), decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                        left: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0),
                        right:  ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        bottom: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0)),
                    child: Text('Tempo: ${dados['current']['condition']['text']}',
                      style: TextStyle(
                          fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 20), decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0),
                        right:  ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        bottom: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0)),
                    child: Text(
                      'País: ${dados['location']['country']}',
                      style: TextStyle(
                          fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 20), decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        top: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0),
                        right:  ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.width, valor: 8.0),
                        bottom: ResponsividadeC.resposividade(tela: MediaQuery.of(context).size.height, valor: 8.0)),
                    child: Text(
                      'Continente: ${dados['location']['tz_id']}'.split('/')[0],
                      style: TextStyle(
                          fontSize: ResponsividadeC.reponsividadeL(larguraX: MediaQuery.of(context).size.width, alturaX: MediaQuery.of(context).size.height, tamanhofixo: 20), decoration: TextDecoration.none, color: cor_horario(dados['location']['localtime'].substring(11,13))[1]),
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
