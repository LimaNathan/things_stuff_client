import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:things_stuff_client/src/core/service/api_service.dart';
import 'package:uno/uno.dart';

class UnoImpl extends ApiService {
  final Uno _uno = Uno();
  final FirebaseAuth firebase;

  UnoImpl(this.firebase) {
    var token = '';
    firebase.currentUser?.getIdToken().then(
          (value) => token = value ?? '',
        );

    _uno.headers.addAll(
      {'Authorization': 'Bearer $token'},
    );
  }

  @override
  Future delete(String url, {required int id}) async {
    try {
      return await _uno.delete(url, params: {'id': '$id'});
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }

  @override
  Future get(String url, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _uno.get(
        url,
        params: (queryParams ?? {}) as Map<String, String>,
      );
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }

  @override
  Future post(String url, {Map<String, dynamic>? body}) async {
    try {
      return await _uno.post(
        url,
        data: body,
      );
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }

  @override
  Future update(String url, {Map<String, dynamic>? body}) async {
    try {
      return await _uno.patch(url, data: body);
    } catch (e) {
      log('error deleting data from api: $e');
    }
  }
}
