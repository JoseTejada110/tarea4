import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea4/models/user_model.dart';
import 'package:tarea4/services/auth_service.dart';
import 'package:tarea4/services/users_service.dart';


class DeletePage extends StatefulWidget {

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {

  List<User> users = [];

  @override
  void initState() {
    _cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar - Haz click en el usuario que desees eliminar'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: this.users.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: Icon(Icons.person),
          title: Text('${this.users[index].name} ${this.users[index].lastName}'),
          subtitle: Text(this.users[index].email),
          hoverColor: Colors.grey[300],
          onTap: () async{
            await authService.deleteUser(this.users[index].uid);
            await _cargarUsuarios();
            setState(() {});
          },
        )
      )
   );
  }


  _cargarUsuarios() async {
    this.users = await getUsers();
    setState(() {});
  }
}