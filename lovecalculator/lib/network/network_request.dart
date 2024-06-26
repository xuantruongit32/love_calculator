import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:love_calculator/models/love.dart';

class NetworkRequest {
  static const url = 'https://love-calculator.p.rapidapi.com/getPercentage';

  static const Map<String, String> headers = {
    'X-RapidAPI-Key': '8fbbb1da01mshe0c658eaefddec0p11181djsn766488090706',
    'X-RapidAPI-Host': 'love-calculator.p.rapidapi.com'
  };

  Future<Love> fetchLove({required Map<String, String>? params}) async {
    try {
      String queryString = Uri(queryParameters: params).query;
      String updateUrl = url + (queryString.isEmpty ? '' : '?$queryString');
      print(updateUrl);
      print(updateUrl);
      print(updateUrl);
      print(updateUrl);
      print(updateUrl);
      final response = await http.get(
        Uri.parse(updateUrl),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Love.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Not found');
      } else {
        throw Exception('Unexpected status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during HTTP request: $e');
    }
  }
}
