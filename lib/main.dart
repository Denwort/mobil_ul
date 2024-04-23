import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './pages/login/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return LoginPage();
  }

}