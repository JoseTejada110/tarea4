import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:tarea4/global/environment.dart';
import 'package:tarea4/models/user_model.dart';


class AuthService with ChangeNotifier {

  late User user;

  //El guion bajoen flutter y dart vuelve la propiedad privada
  bool _autenticando = false;
  //Getter y setter de _autenticando
  bool get autenticando => this._autenticando;
  set autenticando( bool value ) {
    this._autenticando = value;
    notifyListeners();
  }
  

  Future login(String userName, String password) async{
    this.autenticando = true;

    final data = {
      'userName': userName,
      'password': password
    };

    final resp = await http.post( Uri.parse('${Environment.apiUrl}/auth/login'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    print(resp.body);
    this.autenticando = false;

    if( resp.statusCode == 200 ){
      return true;
    } else{
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }

  }

  Future register(String name, String lastName, String email, String phoneNumber, String userName, String password) async{
    this.autenticando = false;
    final data = {
      'name': name,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'password': password,
    };

    final resp = await http.post( Uri.parse('${Environment.apiUrl}/users/register'),
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    print(resp.body);
    this.autenticando = false;

    if( resp.statusCode == 200 ) {
      return true;
    } else{
      final respBody = jsonDecode(resp.body);
      //print(respBody['errors'][0]['msg']);
      return respBody['errors'][0]['msg'];
    }
  }


  Future<bool> deleteUser(String id) async{
    
    this.autenticando = false;

    final resp = await http.delete( Uri.parse('${Environment.apiUrl}/$id'),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    if(resp.statusCode == 200){
      print('Usuario eliminado');
      return true;
    } else{
      return false;
    }

  }
  
}