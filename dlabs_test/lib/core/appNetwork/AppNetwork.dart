import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppNetwork {
  final client = http.Client();
  final baseUrl = "https://dlabs-test.irufano.com/api/movie";

  Future get(url, {Map? body, Map? headers}) async {
    try {
      var uri = Uri.parse("$baseUrl?$url");
      var response = await client.get(uri);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['status'] != "error") {
        var resEncode = jsonDecode(response.body);
        debugPrintThrottled(resEncode.toString());
        return resEncode['data'];
      } else {
        throw jsonDecode(response.body);
      }
    } catch (e) {
      debugPrintThrottled(e.toString());
      rethrow;
    }
  }

  Future post(url, {Map? body, Map? headers}) async {
    try {
      var uri = Uri.parse("$baseUrl");
      var response = await client.post(
        uri,
        body: body,
      );
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['status'] != "error") {
        var resEncode = jsonDecode(response.body);
        debugPrintThrottled(resEncode.toString());
        return resEncode['data'];
      } else {
        throw jsonDecode(response.body);
      }
    } catch (e) {
      debugPrintThrottled(e.toString());
      rethrow;
    }
  }
}
