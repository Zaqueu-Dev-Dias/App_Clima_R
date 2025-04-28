import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'Tela_principal.dart';
import 'carregamento.dart';
import 'lottiefiles_carregamento.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(MaterialApp(home: Carregamento(),));
}

