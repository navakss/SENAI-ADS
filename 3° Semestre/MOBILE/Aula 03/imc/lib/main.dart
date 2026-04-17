import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'IMC', home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? nome;
  double peso = 0.0;
  double altura = 0.0;
  double imc = 0.0;
  String? resultado;
  String? nomenclatura;

  void calcular() {
    imc = peso / (altura * altura);

    if (imc < 16) {
      nomenclatura = "magreza grave";
    } else if (imc < 17) {
      nomenclatura = "magreza moderada";
    } else if (imc < 18.5) {
      nomenclatura = "magreza leve";
    } else if (imc < 25) {
      nomenclatura = "peso ideal";
    } else if (imc < 30) {
      nomenclatura = "sobrepeso";
    } else if (imc < 35) {
      nomenclatura = "obeso";
    } else if (imc < 40) {
      nomenclatura = "obesidade severa";
    } else {
      nomenclatura = "obesidade mórbida";
    }

    resultado =
        "$nome seu IMC é ${imc.toStringAsFixed(1)} você está $nomenclatura";
  }

  void alert(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mensagens"),
          content: Text(msg),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20.0,
            children: [
              Text(
                "Índice de Massa Corpórea",
                style: TextStyle(fontSize: 26.0, color: Colors.red),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (value) {
                  nome = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Peso"),
                onChanged: (value) {
                  peso = double.parse(value);
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Altura"),
                onChanged: (value) {
                  altura = double.parse(value);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  calcular();
                  alert(context, "$resultado");
                },
                child: Text("Ok"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
