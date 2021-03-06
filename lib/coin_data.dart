import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String url ="https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC";
   Future getCoinData(String currency)async{
     Response response = await get(url+currency);
     if(response.statusCode == 200){
       var data = jsonDecode(response.body);
       return(data['last']);
     }
     else{
       print(response.statusCode);
     }
  }
}

// BTCUSD.last