

class ResponsividadeC{
  static double resposividade({required double tela, required double valor}){
    return ((((valor * 100)/tela)*tela)/100);
  }
  static double reponsividadeL({required double larguraX, required double alturaX, required double tamanhofixo}){
      double areafixa = 712 * 360;
    return (((larguraX * alturaX)*tamanhofixo)/areafixa);
  }
}

// (360 * 20) / 100
//  (resultado * 100) / 50


