import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tarea4/routes/routes.dart';
import 'package:tarea4/services/auth_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => AuthService() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD App',
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}