import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ScreenBody extends StatefulWidget {
  const ScreenBody({Key? key}) : super(key: key);

  @override
  _ScreenBodyState createState() => _ScreenBodyState();
}

String _preco = "0";
String _symbol = "BRL";

class _ScreenBodyState extends State<ScreenBody> {
  void _precoBitcoin() async {
    Uri url = Uri.parse('https://blockchain.info/ticker');
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = jsonDecode(response.body);

    setState(() {
      _preco = retorno[_symbol]['buy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/bitcoin.png'),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                _symbol + " " + _preco,
                style: TextStyle(fontSize: 35),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: Text(
                      'Atualizar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onPressed: () {
                    _precoBitcoin();
                  }),
            ),
            DropdownButton<String>(
              value: _symbol,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              underline: Container(height: 2, color: Colors.orange),
              items: <String>[
                "AUD",
                "BRL",
                "CAD",
                "CHF",
                "CLP",
                "CNY",
                "CZK",
                "DKK",
                "EUR",
                "GBP",
                "HKD",
                "HRK",
                "HUF",
                "INR",
                "ISK",
                "JPY",
                "KRW",
                "NZD",
                "PLN",
                "RON",
                "RUB",
                "SEK",
                "SGD",
                "THB",
                "TRY",
                "TWD",
                "USD"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _symbol = newValue!;
                  _precoBitcoin();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
