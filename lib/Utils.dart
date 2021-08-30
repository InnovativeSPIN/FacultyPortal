import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> postfetch(url, data) async {
  final response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=utf-8'
      },
      body: jsonEncode(data));

  return response;
}

SnackBar getSnackBar(text) {
  return SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}
