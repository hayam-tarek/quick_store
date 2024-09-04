import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class API {
  Future<Map<String, dynamic>> get({
    required String url,
    @required Map<String, String>? headers,
  }) async {
    log('url = $url headers = $headers');
    Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      log('response: $json');
      return json;
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    @required dynamic body,
    @required Map<String, String>? headers,
  }) async {
    log('url = $url body = $body headers = $headers');
    Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      log('response: $json');
      return json;
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    @required dynamic body,
    @required Map<String, String>? headers,
  }) async {
    log('url = $url body = $body headers = $headers');
    Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      log('response: $json');
      return json;
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
