import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _val = TextEditingController();
  int _soma = 0;
  String _result = "";
  
  void _somaTudo() {
    setState(() {
      //Verifico se o valor é positivo
  if (int.parse(_val.text) > 0) {
    // Faço um loop até o valor informado
    for (int i = 0; i < int.parse(_val.text); i++) {
      // Verifico se o valor é dividendo por 3 ou 5
      if ((i % 3) == 0 || (i % 5) == 0) {
        // Caso o valor seja dividido acrescendo o valor atual do loop
        _soma += i;
      }
    }
    _result =  "A soma de todos os números múltiplos por 5 e 3 menores que " +
        _val.text +
        " é " +
        _soma.toString() +
        ".";
  } else {
    _result = "Digite um número inteiro positivo.";
  }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Calcula os multiplos de 5 e 3")),
          backgroundColor: Colors.blue[900]),
      body: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Icon(Icons.calculate, size: 100.0, color: Colors.purple.shade900)),
        Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um número",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              controller: _val,
            )),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 5, 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.indigo.shade300,
                    primary: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    textStyle: TextStyle(fontSize: 17),
                  ),
                  onPressed: _somaTudo,
                  child: Text('Somar'),
                ),
              ),
              ]),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(_result,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0)))]));}
}