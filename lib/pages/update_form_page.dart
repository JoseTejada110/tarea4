import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea4/helpers/mostrar_alerta.dart';
import 'package:tarea4/services/auth_service.dart';
import 'package:tarea4/widgets/custom_button.dart';
import 'package:tarea4/widgets/custom_input.dart';


class UpdateFormPage extends StatelessWidget {

  final nameController     = new TextEditingController();
  final lastNameController = new TextEditingController();
  final emailController    = new TextEditingController();
  final phoneNumberController = new TextEditingController();
  final confirmPassController = new TextEditingController();
  final passwordController = new TextEditingController();
  final userNameController = new TextEditingController();
  
  final String uid;

  UpdateFormPage({required this.uid});


  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text('Actualizar Usuario', style: TextStyle(
                  fontSize: 30, 
                  color: Colors.black, 
                  fontWeight: FontWeight.bold
                )),
              ),
              SizedBox(height: 20),
        
              CustomInput(
                placeholder: 'Nombre',
                keyboardType: TextInputType.text,
                textController: nameController,
              ),
        
              CustomInput(
                placeholder: 'Apellido',
                keyboardType: TextInputType.text,
                textController: lastNameController,
              ),
        
              CustomInput(
                placeholder: 'Correo Electrónico',
                keyboardType: TextInputType.emailAddress,
                textController: emailController,
              ),
        
              CustomInput(
                placeholder: 'Número Telefónico',
                keyboardType: TextInputType.text,
                textController: phoneNumberController,
              ),
        
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
        
              CustomInput(
                placeholder: 'Confirmar Contraseña',
                keyboardType: TextInputType.text,
                isPassword: true,
                textController: confirmPassController,
              ),
        
              CustomButton(
                title: 'Actualizar',
                onPressed: authService.autenticando ? null : () async {

                  if(passwordController.text.trim() != confirmPassController.text.trim()) {
                    return mostrarAlerta(context, 'Contraseñas diferentes', 'Las contraseñas no coinciden');
                  }

                  final updateOk = await authService.updateUser(
                    this.uid,
                    nameController.text.trim(), 
                    lastNameController.text.trim(),
                    emailController.text.trim(),
                    phoneNumberController.text.trim(),
                    userNameController.text.trim(),
                    passwordController.text.trim()
                  );

                  if(updateOk == true) {
                    Navigator.pushReplacementNamed(context, 'users');
                  } else{
                    mostrarAlerta(context, 'Registro incorrecto', updateOk);
                  }
                },
              ),
        
              SizedBox(height: 20),
        
              GestureDetector(
                child: Text('Volver atrás', style: TextStyle(color: Colors.black, fontSize: 18)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'update');
                },
              ),
            ],
          ),
        ),
     ),
   );
  }
}