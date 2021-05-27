




import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider_and_dio/Controller/utils.dart';
import 'package:provider_and_dio/Model/viewmodel.dart';

class Networks{
  static Map<String,String> headers = {
    'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String API_LIST = "jsonplaceholder.typicode.com/posts";
  static String API_CREATE = "jsonplaceholder.typicode.com/posts";
  static String API_UPDATE = "jsonplaceholder.typicode.com/posts/"; //{id}
  static String API_DELETE = "jsonplaceholder.typicode.com/posts/"; //{id}
   static Future<String > GET(String api)async{
     try {
       var response = await Dio().get(api);
       if(response.statusCode==200){
         print(response.data);
        return response.data.toString();
       }
       return null;
     } catch (e) {
       print(e);
       Utils.fireToast("data is ${e}");
     }


   }





  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, dynamic> paramsCreate(Posting post) {
    Map<String, String> params = new Map();
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Posting post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString(),
    });
    return params;
  }

  /* Http Parsing */

  static List<Posting> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Posting>.from(json.map((x) => Posting.fromJson(x)));
    return data;
  }




}