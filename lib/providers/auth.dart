// ignore_for_file: unnecessary_null_comparison, avoid_init_to_null

import 'dart:convert';

import 'package:appshoes/exceptions/auth_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Auth with ChangeNotifier {
  String? _token = null;
  DateTime? _expiryDate = null;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now())) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> _authenticate(
      String? email, String? password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCvGnr4YkegoujdzVooeq4tjBcV0sBXsek';

    final response = await post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final responseBody = json.decode(response.body);

    if (responseBody['error'] != null) {
      throw AuthException(responseBody['error']['message']);
    } else {
      _token = responseBody["idToken"];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseBody['expiresIn']),
        ),
      );

      notifyListeners();
    }

    return Future.value();
  }

  Future<void> signup(String? email, String? password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String? email, String? password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
