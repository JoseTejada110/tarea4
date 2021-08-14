import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea4/helpers/mostrar_alerta.dart';
import 'package:tarea4/services/auth_service.dart';
import 'package:tarea4/widgets/custom_button.dart';
import 'package:tarea4/widgets/custom_input.dart';


class LoginPage extends StatelessWidget {

  final userNameController = new TextEditingController();
  final passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Center(
        child: Container(
          alignment: Alignment.centerLeft,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text('LOGIN', style: TextStyle(
                  fontSize: 35, 
                  color: Colors.black, 
                  fontWeight: FontWeight.bold
                )),
              ),
              SizedBox(height: 40),

              CustomInput(
                placeholder: 'Nombre de Usuario',
                keyboardType: TextInputType.text,
                textController: userNameController,
              ),

              CustomInput(
                placeholder: 'Contraseña',
                keyboardType: TextInputType.text,
                isPassword: true,
                textController: passwordController,
              ),

              CustomButton(
                title: 'Entrar',
                onPressed: authService.autenticando ? null : () async{

                  final loginOk = await authService.login(userNameController.text.trim(), passwordController.text.trim());
                  if(loginOk == true) {
                    Navigator.pushReplacementNamed(context, 'users');
                  } else{
                    mostrarAlerta(context, 'Inicio de sesión incorrecto', loginOk);
                  }
                },
              ),

              SizedBox(height: 20),

              GestureDetector(
                child: Text('Registrarse', style: TextStyle(color: Colors.black, fontSize: 18)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'register');
                },
              ),
            ],
          ),
        ),
     ),
   );
  }
}