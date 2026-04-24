import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/ui/splash.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nome = '';
  String idade = '';

  @override
  void initState() {
    super.initState();
    obterNome();
    obterIdade();
  }

  Future<void> obterNome() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('nome')) {
      setState(() {
        nome = json.decode(prefs.getString('nome')!);
      });
    }
  }

Future<void> obterIdade() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('idade')) {
    setState(() {
      idade = json.decode(prefs.getString('idade')!); 
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nome), backgroundColor: Colors.blueGrey),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Olá! Seu nome é $nome e sua idade é $idade'),
            ElevatedButton(
              onPressed: () {
                //Reiniciar o aplicativo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
