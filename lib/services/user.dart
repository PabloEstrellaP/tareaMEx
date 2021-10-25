import 'dart:convert';


import 'package:ejemplo_consumo/global/enviroment.dart';
import 'package:ejemplo_consumo/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class UserService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ]
  );

  static Future RegisterGoogle() async {
    try{
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      final signInWithGoogleEndpoint = getPath('/');
      final session = await http.post(signInWithGoogleEndpoint,
        body: {
          'token' : googleKey.idToken
        }
      );
      final body = jsonDecode(session.body);
      return body;
    }
    catch( err ){
      print( err );
      return null;
    }
  }

  static Future signInGoogle() async {
    try{
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      final signInWithGoogleEndpoint = getPath('/login');
      final session = await http.post(signInWithGoogleEndpoint,
        body: {
          'token' : googleKey.idToken
        }
      );
      final body = jsonDecode(session.body);
      return body;
    }
    catch( err ){
      print( err );
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }

  static Future saveUserData( User data ) async {
    final _storage = FlutterSecureStorage();
    await _storage.write(key: 'name', value: data.name);
    await _storage.write(key: 'email', value: data.email);
    await _storage.write(key: 'imgPath', value: data.imgPath);
    return await _storage.write(key: 'id', value: data.id);
  }

  static Future deleteUserData() async {
    final _storage = FlutterSecureStorage();
    await _storage.deleteAll();
  }

  static Future getUserData() async {
    final _storage = FlutterSecureStorage();
    final name = await _storage.read(key: 'name');
    final email = await _storage.read(key: 'email');
    final imgPath = await _storage.read(key: 'imgPath');
    final id = await _storage.read(key: 'id');
    User user = new User(
      name: name.toString(), 
      email: email.toString(), 
      imgPath: imgPath.toString(), 
      id: id.toString()
    );
    return user;
  }

  static getPath( pathService ){
    return Uri(
      scheme: Enviroment.scheme,
      host: Enviroment.host,
      port: 3001,
      path: '/user' + pathService
    );
  }
}