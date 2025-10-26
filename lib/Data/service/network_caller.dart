import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String errorMassage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,

    this.errorMassage = 'Something happend wrong',
  });
}
class NetworkCaller{
  static Future<NetworkResponse> getRequest(
      {required String url,})async
  {

    try{
      Uri uri = Uri.parse(url);
      debugPrint('URl => $url');
      Response response = await get(uri);
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    }catch(e){
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
          errorMassage: e.toString()
      );


    }


  }

  static Future<NetworkResponse> postRequest(
      {required String url,Map<String,dynamic>?body})async
  {
    try{
      Uri uri = Uri.parse(url);
      debugPrint('URl => $url');
      debugPrint('BODY => $body');
      Response response = await post(uri,
          headers: {
            'content-type':'application/json'
          },
          body: jsonEncode(body));
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    }catch(e){
      return NetworkResponse(
          isSuccess: false,
          statusCode: -1,
          errorMassage: e.toString()
      );

    }


  }
}