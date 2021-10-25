import 'package:ejemplo_consumo/pages/login.dart';
import 'package:flutter/material.dart';

import 'package:ejemplo_consumo/pages/register.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'register' : ( _ ) => RegisterApp(),
  'login'    : ( _ ) => LoginPage()
};