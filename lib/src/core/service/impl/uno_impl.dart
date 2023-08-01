import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:things_stuff_client/src/core/service/api_service.dart';
import 'package:uno/uno.dart';

class UnoImpl extends ApiService {
  late final Uno _uno = Uno();
  final FirebaseAuth firebase;

  Future<Map<String, String>> _getHeaders() async {
    final token = await firebase.currentUser?.getIdToken();
    final headers = <String, String>{};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    return headers;
  }

  UnoImpl(this.firebase);

  @override
  Future delete(String url, {required int id}) async {
    try {
      final response = await _uno.delete(
        url,
        params: {
          'id': '$id',
        },
        headers: await _getHeaders(),
      );

      if (response.status == 200) {
        return response;
      } else {
        throw Exception();
      }
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }

  @override
  Future get(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _uno.get(
        url,
        params: (queryParams ?? {}) as Map<String, String>,
        headers: await _getHeaders(),
      );
      if (response.status == 200) {
        return response;
      } else {
        throw Exception();
      }
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }

  @override
  Future post(String url, {Map<String, dynamic>? body}) async {
    try {
      final response =
          await _uno.post(url, data: body, headers: await _getHeaders());
      if (response.status == 200 || response.status == 201) {
        return response;
      } else {
        throw Exception();
      }
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }

  @override
  Future update(String url, {Map<String, dynamic>? body}) async {
    try {
      final response = await _uno.patch(
        url,
        data: body,
        headers: await _getHeaders(),
      );
      if (response.status == 200) {
        return response;
      } else {
        throw Exception();
      }
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }
}
