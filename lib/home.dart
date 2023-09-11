import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerEtanol = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";
  void _calcular() {
    double? precoEtanol = double.tryParse(_controllerEtanol.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoEtanol == null || precoGasolina == null) {
      
    setState(() {
       _textoResultado =
    ("Número ivalido, digite número maiores que 0 e utilizando (.)");
    });
   
    }else{
      if ((precoEtanol/precoGasolina)>=0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
          _limparCampos();

        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com etanol";
          _limparCampos();
        });
      }
    }
  }

  void _limparCampos(){
    _controllerEtanol.clear();
    _controllerGasolina.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etanol x Gasolina"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image(
                    image: AssetImage("imagens/etanolgasolina.png"),
                    width: 200,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 246, 97, 204),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Preço Etanol. Ex 3.50"),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: _controllerEtanol,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Preço Gasolina. Ex 4.50"),
                style: TextStyle(
                  fontSize: 25,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.pink,
                      textStyle: TextStyle(fontSize: 25)),
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
