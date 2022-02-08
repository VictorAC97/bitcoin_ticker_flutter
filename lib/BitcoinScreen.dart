import 'package:bitcoin_price_checker/BitcoinScreenBody.dart';
import 'package:flutter/material.dart';

class BitcoinScreen extends StatefulWidget {
  const BitcoinScreen({Key? key}) : super(key: key);

  @override
  _BitcoinScreenState createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBody(),
    );
  }
}
