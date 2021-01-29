import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:steuermachen/dio.dart';
import 'package:steuermachen/models/user.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _authenticated = false;
  User _user;

  bool get authenticated => _authenticated;
  User get user => _user;

  Future login({Map credentials}) async {
    String deviceId = await getDeviceID();
    Dio.Response response = await dio().post('auth/token',
        data: jsonEncode(credentials..addAll({'deviceId': deviceId})));

    String token = jsonDecode(response.toString())['token'];

    await attempt(token);
  }

  Future attempt(String token) async {
    try {
      Dio.Response response = await dio().get('auth/user',
          options: Dio.Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      _user = User.fromJson(jsonDecode(response.toString()));

      _authenticated = true;
    } catch (exception) {
      _authenticated = false;
    }

    notifyListeners();
  }

  Future getDeviceID() async {
    String deviceId;

    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } catch (exception) {
      // ToDo
    }

    return deviceId;
  }

  void logout() {
    _authenticated = false;

    notifyListeners();
  }
}
