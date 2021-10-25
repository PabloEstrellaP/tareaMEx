import 'dart:convert';

import 'package:ejemplo_consumo/models/user.dart';
import 'package:ejemplo_consumo/pages/menu.dart';
import 'package:ejemplo_consumo/widgets/labels.dart';
import 'package:ejemplo_consumo/widgets/materialButton.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo_consumo/services/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                MaterialButonGoogle(
                  onPressed: () async {
                    final response = await UserService.signInGoogle();
                    if( response['ok'] ){
                      ShowToast('se ha iniciado sesión');
                      User data = User.fromJson(response['msg']);
                      await UserService.saveUserData( data );
                      Navigator.pushReplacement(
                        context, 
                        PageRouteBuilder(
                          pageBuilder: ( _, __, ___ ) => MenuPage(),
                          transitionDuration: Duration(milliseconds: 0)
                        )
                      );
                    }else{
                      await UserService.signOut();
                    }
                  },
                  title: 'Login con google',
                ),
                Labels(
                  path: 'register', 
                  title: '¿No tienes una cuenta?', 
                  subTitle: '¡Registra una!'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowToast( msg ){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      webBgColor: "#e74c3c",
      textColor: Colors.white,
      timeInSecForIosWeb: 10
    );
  }
}