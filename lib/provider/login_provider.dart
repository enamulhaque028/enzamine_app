import 'dart:convert';
import 'dart:developer';
import 'package:aits_task/config/utils/api_list.dart';
import 'package:aits_task/config/utils/auth_status.dart';
import 'package:aits_task/config/utils/sp_utils.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  AuthenticationStatus _status = AuthenticationStatus.unknown;
  AuthenticationStatus get status => _status;

  Future<AuthenticationStatus> logIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    showDialog(
      context: context, barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      Map payload = {
        "grant_type": password,
        "client_id": 2,
        "client_secret": "UF9kmGh5ks1y7UOn8yqTEXkq6CvXSpekQdy9tryb",
        "username": email,
        "password": "12345678",
        "scope": "*",
        "app_name": "virtunus_auth",
      };

      var body = jsonEncode(payload);
      Uri url = Uri.parse(ApiList.loginUrl);

      var response = await http.post(
        url,
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
        
      if (response.statusCode == 200) {
        log(response.body);
        // var resp = jsonDecode(response.body);
        SharedPref().setLoginResponse(response.body);
        Navigator.of(context).pop();
        _status = AuthenticationStatus.authenticated;
        notifyListeners();
        return _status;
      } else {
        log(response.body);
        var resp = jsonDecode(response.body);
        Navigator.of(context).pop();
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: '${resp['message']}',
        );
        _status = AuthenticationStatus.unauthenticated;
        notifyListeners();
        return _status;
      }
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red,),
      );
      _status = AuthenticationStatus.unauthenticated;
      notifyListeners();
      return _status;
    }
  }
}
