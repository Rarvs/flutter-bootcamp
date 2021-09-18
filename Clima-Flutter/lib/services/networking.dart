import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.uri);

  String uri;

  Future getData() async {
    Uri url = Uri.parse(uri);
    http.Response response = await http.get(url);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      debugPrint(response.statusCode.toString());
    }
  }
}
