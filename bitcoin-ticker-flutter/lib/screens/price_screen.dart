import 'dart:io' show Platform;

import 'package:bitcoin_ticker/model/coin_data.dart';
import 'package:bitcoin_ticker/services/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'BRL';
  CoinData coinData = CoinData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: buildCryptoCards(),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? buildCupertinoPicker() : buildDropdown(),
          ),
        ],
      ),
    );
  }

  List<Widget> buildCryptoCards() {
    List<CryptoCard> cards = [];

    for (String crypto in cryptoList) {
      cards.add(
          CryptoCard(cryptoSym: crypto, selectedCurrency: selectedCurrency));
    }

    return cards;
  }

  DropdownButton buildDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton(
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value) {
          print(value);
          setState(() {
            selectedCurrency = value;
          });
        });
  }

  CupertinoPicker buildCupertinoPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        children: pickerItems,
        itemExtent: 24.0,
        onSelectedItemChanged: (value) {
          print(value);
        });
  }
}

class CryptoCard extends StatefulWidget {
  const CryptoCard({
    Key key,
    @required this.cryptoSym,
    @required this.selectedCurrency,
  }) : super(key: key);

  final String cryptoSym;
  final String selectedCurrency;

  @override
  _CryptoCardState createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  String cryptoValue = '?';

  void updateCryptoValue() {
    setState(() {
      getCryptoData(widget.cryptoSym, widget.selectedCurrency);
    });
  }

  @override
  void initState() {
    getCryptoData(widget.cryptoSym, widget.selectedCurrency);
    super.initState();
  }

  Future<String> getCryptoData(
      String cryptoSym, String selectedCurrency) async {
    var cryptoData =
        await CryptoModel().getCryptoData(cryptoSym, selectedCurrency);
    setState(() {
      if (cryptoData != null) {
        cryptoValue = cryptoData[selectedCurrency].toString();
        print(cryptoValue);
      } else {
        cryptoValue = '?';
      }
    });
    return cryptoValue;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5));
    updateCryptoValue();
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 ${widget.cryptoSym} = $cryptoValue ${widget.selectedCurrency}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
