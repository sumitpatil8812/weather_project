import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ApiService {
  Future<void> get({
    required String endpoint,
    required Function(Map<String, dynamic> responseData) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      final response = await http.get(Uri.parse('$endpoint'));
      _handleResponse(response, onSuccess, onError);
    } catch (e) {
      onError('Failed to connect to the server');
    }
  }

  Future<void> post({
    required String endpoint,
    required dynamic data,
    required Function(Map<String, dynamic> responseData) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      _handleResponse(response, onSuccess, onError);
    } catch (e) {
      onError('Failed to connect to the server');
    }
  }

  void _handleResponse(
    http.Response response,
    Function(Map<String, dynamic> responseData) onSuccess,
    Function(String errorMessage) onError,
  ) {
    try {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        onSuccess(responseData);
      } else {
        _handleError(responseData, onError);
      }
    } catch (e) {
      onError('An unexpected error occurred');
    }
  }

  void _handleError(
    Map<String, dynamic> errorData,
    Function(String errorMessage) onError,
  ) {
    final errorMessage = errorData['error'] ?? 'An error occurred';
    onError(errorMessage);
    Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
