import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:tarea4/services/auth_service.dart';
import 'package:tarea4/models/user_model.dart';
import 'package:tarea4/widgets/custom_button.dart';


class UsersPage extends StatefulWidget {

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  List<User> usersList = [
    User(
      name: 'test1',
      lastName: 'test1lastName',
      phoneNumber: '809-578-1111',
      email: 'test1@test.com',
      userName: 'test1userName',
      password: '123456',
    ),
    User(
      name: 'test2',
      lastName: 'test2lastName',
      phoneNumber: '809-578-1111',
      email: 'test2@test.com',
      userName: 'test2userName',
      password: '123456',
    ),
    User(
      name: 'test3',
      lastName: 'test3lastName',
      phoneNumber: '809-578-1111',
      email: 'test3@test.com',
      userName: 'test3userName',
      password: '123456',
    ),
  ];

  final TextStyle style = new TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold
  );

  @override
  void initState() {
    this._cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Clientes Registrados', style: TextStyle(color: Colors.black, fontSize: 35)),
      ),
      backgroundColor: Colors.white,

      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _cargarUsuarios,
        header: WaterDropHeader(
          complete: Icon( Icons.check, color: Colors.blue[400] ),
          waterDropColor: Colors.blue,
        ),

        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _createTable(),
      
                SizedBox(height: 25),
      
                _createButtons(context)
              ],
            ),
          ),
        ),
      ),
   );
  }

  _cargarUsuarios() async{
     //this.usersList = await usersService.getUsers();
    //print(this.usersList);
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
    _refreshController.refreshCompleted();
  }

  DataTable _createTable() {

    return DataTable(
          columns: [
            DataColumn(label: Text('Nombre', style: style,)),
            DataColumn(label: Text('Apellido', style: style,)),
            DataColumn(label: Text('Teléfono', style: style,)),
            DataColumn(label: Text('Correo Electrónico', style: style)),
            DataColumn(label: Text('Usuario', style: style)),
          ], 
          rows: List.generate(
            usersList.length, 
            (i) => _generateRows(this.usersList[i])
          )
        );
  }

  DataRow _generateRows(User user) {
    return DataRow(
      cells: [
        DataCell(Text(user.name)),
        DataCell(Text(user.lastName)),
        DataCell(Text(user.phoneNumber)),
        DataCell(Text(user.email)),
        DataCell(Text(user.userName)),
      ]
    );
  }

  Widget _createButtons(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(width:15),

        CustomButton(
          title: 'Nuevo',
          titleColor: Colors.white,
          width: 160,
          onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
        ),

        SizedBox(width:15),

        CustomButton(
          title: 'Actualizar',
          titleColor: Colors.white,
          width: 160,
          onPressed: () {},
        ),

        SizedBox(width:15),

        CustomButton(
          title: 'Eliminar',
          titleColor: Colors.white,
          width: 160,
          onPressed: authService.autenticando ? null : () {},
        ),

        SizedBox(width:15),

        CustomButton(
          title: 'Cerrar Sesión',
          titleColor: Colors.white,
          width: 160,
          onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
        ),

        SizedBox(width:15),
      ],
    );
  }
}