import 'package:http/http.dart' as http;

import 'package:tarea4/global/environment.dart';
import 'package:tarea4/models/user_model.dart';
import 'package:tarea4/models/users_response.dart';

Future<List<User>> getUsers() async {

  List<User> users = [];

  try {
    final resp = await http.get( Uri.parse('${Environment.apiUrl}/users/'),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    final usersResponse = usersResponseFromJson(resp.body);
    users = usersResponse.users;
    return users;

  } catch (e) {
    print('Error al obtener usuarios');
    return users;
  }
    
}