import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  String nome = "";
  double preco = 0.0;
  int quantidade = 0;
  double subtotal = 0.0;

  void calcular() {
    subtotal = quantidade * preco;
    mostrarResult();
  }

  void mostrarResult() {
    if (mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(nome),
          content: Text("O subtotal é ${subtotal.toStringAsFixed(2)}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fundo.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(0, 0, 0, 0.5),
              BlendMode.dstATop,
            ),
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
            Center(child: Text("Produtos")),
            TextField(
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (value) {
                nome = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Preço"),
              onChanged: (value) {
                preco = double.parse(value);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Quantidade"),
              onChanged: (value) {
                quantidade = int.parse(value);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calcular(),
                  child: Text("Calcular"),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Sair"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
