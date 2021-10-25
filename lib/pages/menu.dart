import 'package:ejemplo_consumo/models/user.dart';
import 'package:ejemplo_consumo/pages/login.dart';
import 'package:ejemplo_consumo/services/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  
  User user = new User(
    name: '', 
    email: 'email', 
    imgPath: '', 
    id: '');

  @override
  void initState (){
    super .initState ();
    _getUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await UserService.signOut();
              await UserService.deleteUserData();
              Navigator.pushReplacement(
                context, 
                PageRouteBuilder(
                  pageBuilder: ( _, __, ___ ) => LoginPage(),
                  transitionDuration: Duration(milliseconds: 0)
                )
              );         
            }, 
            icon: Icon( FontAwesomeIcons.doorOpen )
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.imgPath),
                    maxRadius: MediaQuery.of(context).size.height * 0.12,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(user.name),
                  SizedBox(
                    height: 50,
                  ),
                  Text(user.email),
                ],
              ),
            ),
          )),
      ),
    );
  }
  Future<void> _getUser() async {
    
    user = await UserService.getUserData();
    setState(() {
      
    });
  }
}