import 'dart:developer';
import 'package:app/controllers/provider/home_provider.dart';
import 'package:app/controllers/services/login_api_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Future<void> authenticateUser(
      String username, String password, BuildContext context) async {
    // log('provider:$username $password');
    AuthService authService = AuthService();
    // log('Before fetch ');
    String? userAuth = await authService.authenticateUser(username, password);
    // log('after fetch $userAuth');

    if (userAuth != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', userAuth.toString());
      String? token = prefs.getString('token');
      // log('token in sharedpref:$token');
      HomeProvider homeprovider = HomeProvider();
      homeprovider.fetchLeadList();
      Navigator.pushNamed(context, '/home');
    } else {
      Fluttertoast.showToast(
        msg: "Some went wrong!!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
      );
    }

    notifyListeners();
  }
}
