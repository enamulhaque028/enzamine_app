import 'dart:convert';
import 'dart:developer';
import 'package:aits_task/config/utils/api_list.dart';
import 'package:aits_task/config/utils/auth_status.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationProvider with ChangeNotifier {
  AuthenticationStatus _status = AuthenticationStatus.unknown;
  AuthenticationStatus get status => _status;

  Future<AuthenticationStatus> registration(
    String name,
    String email,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    showDialog(
      context: context, barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      Map payload = {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      };

      var body = jsonEncode(payload);
      Uri url = Uri.parse(ApiList.registrationUrl);

      var response = await http.post(
        url,
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
        log(response.statusCode.toString());
      if (response.statusCode == 201) {
        log(response.body);
        // var resp = jsonDecode(response.body);
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
      _status = AuthenticationStatus.unauthenticated;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
      notifyListeners();
      return _status;
    }
  }
}
