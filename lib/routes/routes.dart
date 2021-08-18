import 'package:flutter/material.dart';

import 'package:tarea4/pages/login_page.dart';
import 'package:tarea4/pages/register_page.dart';
import 'package:tarea4/pages/users_page.dart';
import 'package:tarea4/pages/delete_page.dart';
import 'package:tarea4/pages/update_page.dart';



final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login'     : ( _ ) => LoginPage(),
  'register'  : ( _ ) => RegisterPage(),
  'users'     : ( _ ) => UsersPage(),
  'update'    : ( _ ) => UpdatePage(),
  'delete'    : ( _ ) => DeletePage(),
};