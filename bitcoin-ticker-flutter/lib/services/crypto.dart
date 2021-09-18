import 'package:bitcoin_ticker/services/crypto_network.dart';

const API_KEY =
    "343faeab76773629f8f03a31a2558f2a68ca879df42dced3cefa24b5c5b1311e";
const REQUEST_URL = "https://min-api.cryptocompare.com";

class CryptoModel {
  Future<dynamic> getCryptoData(String cryptoSym, String currency) async {
    CryptoNetwork cryptoNetwork = CryptoNetwork(
        '$REQUEST_URL/data/price?fsym=$cryptoSym&tsyms=$currency&api_key=$API_KEY');
    return await cryptoNetwork.getData();
  }
}
