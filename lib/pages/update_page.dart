import 'package:flutter/material.dart';

import 'package:tarea4/models/user_model.dart';
import 'package:tarea4/pages/update_form_page.dart';
import 'package:tarea4/services/users_service.dart';


class UpdatePage extends StatefulWidget {

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  List<User> users = [];

  @override
  void initState() {
    _cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar - Haz click en el usuario que desees actualizar'),
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
            //await authService.deleteUser(this.users[index].uid);
            Navigator.push(context, _createRoute( this.users[index].uid));
            await _cargarUsuarios();
            setState(() {});
          },
        )
      )
   );
  }

  Route _createRoute(String uid) {

    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context, 
        Animation<double> animation, 
        Animation<double> secondaryAnimation
      ) => UpdateFormPage(uid: uid),

      transitionDuration: new Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero).animate(curvedAnimation),
          child: child,
        );
      
      }

    );

  }


  _cargarUsuarios() async {
    this.users = await getUsers();
    setState(() {});
  }
}