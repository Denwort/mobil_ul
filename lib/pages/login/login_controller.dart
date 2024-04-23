import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class LoginController extends GetxController{
    
    TextEditingController userController = TextEditingController();
    TextEditingController passController = TextEditingController();
    RxString message = 'primer mensaje'.obs;
    Rx<MaterialColor> messageColor = Colors.yellow.obs;

    void login(){
        print('hola desde el controlador');
        print(userController.text);
        print(passController.text);
        String user = userController.text;
        String password = passController.text;
        if(user == 'admin' && password == '123'){
            message.value ='Usuario correcto';
        }
        else {
            message.value = 'Usuario incorrecto';
        }

        // Que el mensaje desaparezca luego de 5 segundos
        Future.delayed(Duration(seconds: 5), (){
            message.value = '';
        });
    }

}