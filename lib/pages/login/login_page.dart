import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import './login_controller.dart';

class LoginPage extends StatelessWidget {

    LoginController control = Get.put(LoginController());

  Widget _links(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('clicked!');
                },
                child: Text(
                  'Crear Cuenta',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFF26F29),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('clicked!');
                },
                child: Text(
                  'Recuperar Contraseña',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFF26F29),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }


  Widget _form(BuildContext context, bool isKeyboardOpen){
    return Container(
      height: 340,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF999999), width: 2.0),
        color: Colors.white
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.1, // Margen izquierdo
              MediaQuery.of(context).size.width * (isKeyboardOpen ? 0.3 : 0.9), // Margen superior
              MediaQuery.of(context).size.width * 0.1, // Margen derecho
              MediaQuery.of(context).size.width * 0.1, // Margen inferior
            ),
      // Column : ES UNO DEBAJO DEL OTRO
      // Row : ES UNO AL COSTADO DEL OTRO
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        //PARA GENERAR UN ESPACIO
        SizedBox(height: 15),
        /*
        Image.network(
        'https://upload.wikimedia.org/wikipedia/commons/0/0e/ULIMA_logo.png', // URL de la imagen
        width: 50, // Ancho de la imagen
        height: 50, // Alto de la imagen
        fit: BoxFit.cover, // Ajuste de la imagen
        ),
        */
        Text('Bienvenido'),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Usuario', // Etiqueta del campo de texto
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.zero), // Borde del campo de texto
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.black), // Color del borde al enfocar
                ),
              ),
              controller: control.userController,
            )
          ]
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Contraseña', // Etiqueta del campo de texto
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.zero), // Borde del campo de texto
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.black), // Color del borde al enfocar
                ),
              ),
              controller: control.passController,
            )
          ]
        ),
        SizedBox(
          width: double.infinity, // Ocupar todo el ancho disponible
          child: TextButton(
            onPressed: () {
              // Función que se ejecuta cuando se presiona el botón
              control.login();
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  Color(0XFFF26F29), // Color de fondo del botón
              padding: EdgeInsets
                  .zero, // Padding cero para eliminar el espacio interno
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius
                    .zero, // Bordes cero para eliminar los bordes
              ),
            ),
            child: Text(
              'Ingresar',
              style: TextStyle(
                color: Colors.white, // Color del texto
                fontSize: 14,
              ),
            ),
          ),
        ),
        Obx(()=> Text(control.message.value)),

        SizedBox(
          width: double.infinity, // Ocupar todo el ancho disponible
          child: TextButton(
            onPressed: () {
              // Función que se ejecuta cuando se presiona el botón
              print('Botón presionado');
            },
            style: TextButton.styleFrom(
              backgroundColor:
                  Color(0XFF008000), // Color de fondo del botón
              padding: EdgeInsets
                  .zero, // Padding cero para eliminar el espacio interno
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius
                    .zero, // Bordes cero para eliminar los bordes
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons
                      .google, // Icono de Google de Font Awesome
                  color: Colors.white, // Color del icono
                  size: 20, // Tamaño del icono
                ), // Icono
                SizedBox(
                    width: 12), // Espacio entre el icono y el texto
                Text(
                  'Ingresar con Google',
                  style: TextStyle(
                    color: Colors.white, // Color del texto
                  ),
                ),
              ],
            ),
          ),
        ),
        _links(context)
      ],
      ),
    );
  }

  Widget _background(BuildContext context) {
    return Container(
          color: Color(0xFFF2F2F2)
        );
  }

  Widget _imageBackground(BuildContext context){
    return Column(children: [
      Expanded(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.png'),
            fit: BoxFit.cover
          )
        )
      ), flex: 1),
      Expanded(child: Text(''), flex: 1)
    ],);
  }

  Widget _buildBody(BuildContext context){
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    print(isKeyboardOpen);
    return Stack(
      //equivalente a <div>
      children: <Widget>[
        _background(context),
        _imageBackground(context),
        _form(context, isKeyboardOpen)

      ]
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: Scaffold(
        body: _buildBody(context)
      ),
    );
  }


}