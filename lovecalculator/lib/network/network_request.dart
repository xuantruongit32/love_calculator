import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:lovecalculator/models/love.dart';

class NetworkRequest {
  static const url = 'https://love-calculator.p.rapidapi.com/getPercentage';

  static const Map<String, String> headers = {
    'X-RapidAPI-Key': '8fbbb1da01mshe0c658eaefddec0p11181djsn766488090706',
    'X-RapidAPI-Host': 'love-calculator.p.rapidapi.com'
  };

  List<Love> parseLove(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Love> loveList = list.map((e) => Love.fromJson(e)).toList();
    return loveList;
  }

  Future<List<Love>> fetchLove({Map<String, String>? params}) async {
    String queryString = Uri(queryParameters: params).query;
    String updateUrl = url + (queryString.isEmpty ? '' : '?$queryString');
    final response = await http.get(
      Uri.parse(updateUrl),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return compute(parseLove, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Cannot get');
    }
  }
}