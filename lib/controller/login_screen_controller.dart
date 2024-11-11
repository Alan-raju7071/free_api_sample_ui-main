import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:token_test/model/login_response_model.dart';

class LoginScreenController with ChangeNotifier {
  bool isLoading=false;
  Future<void> login({
   required String email,required String Password}
  ) async {
    final url=Uri.parse("https://freeapi.luminartechnohub.com/login");
    isLoading=true;
    notifyListeners();
    try{
    final response=  await http.post(url,body: {
  "email": email,
  "password": Password
});
if(response.statusCode ==200){
   Loginresmodel logmodel=loginresmodelfromjson(response.body);
   if(logmodel.access !=null && logmodel.access!.isNotEmpty){
    SharedPreferences prefs=await SharedPreferences.getInstance();
   await prefs.setString("access", logmodel.access.toString());
   
    await prefs.setString("refresh", logmodel.refresh.toString());
   }
}

    }
    catch(e){
      print(e);

    }
    isLoading=false;
    notifyListeners();
  }
}
