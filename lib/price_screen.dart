import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart' ;




CoinData coinData = CoinData();
 
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurreny = "USD";

   Widget getDropDownItems(){
    List <DropdownMenuItem<String>> result = [];
    for (String list in currenciesList){
     var dropDownMenu = DropdownMenuItem(
        value:list,
        child: Text(list),
      );
      result.add(dropDownMenu);
    }
     return DropdownButton(
              value: selectedCurreny,
              items: result,
              onChanged: (value){
                setState(() {
                  selectedCurreny = value;
                }
                );
              },
            );
   
  }
  Widget getPickerItems(){
     List<Text> result = [];
    for (String currency in currenciesList){
      var newitems = Text(currency);
      result.add(newitems);

    }
    return CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex){
               
              },
              children: result
    );
  }
  String bitCoinInUsd = "?";

  getData() async{
    double data = await coinData.getCoinData();
    setState(() {
      bitCoinInUsd = data.toStringAsFixed(0);
    });
  }
  @override
  void initState() {
     getData();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  'BTCUSD $bitCoinInUsd USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:Platform.isIOS?getPickerItems():getDropDownItems(),
          ),
        ],
      ),
    );
  }
}


