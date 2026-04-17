import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

String nome = "";
int idade = 0;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Image.asset('assets/cartoon.png', width: 300, height: 300),

              const Text("Nome", style: TextStyle(fontSize: 18)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 200),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira seu Nome...',
                  ),
                  onChanged: (value) {
                    nome = value;
                  },
                ),
              ),

              const Text("Idade", style: TextStyle(fontSize: 18)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 200),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira sua Idade...',
                  ),
                  onChanged: (value) {
                    idade = int.parse(value);
                  },
                ),
              ),

              ElevatedButton(
                onPressed: () {},
                child: Text("Entrar", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
