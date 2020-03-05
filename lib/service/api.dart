import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_gitreader/model/user.dart';

class Api{
  Api();
  static Dio dio = new Dio(BaseOptions(
    baseUrl: "https://gitee.com/api/v5",
    headers: {
      HttpHeaders.contentTypeHeader:"application/json;charset=UTF-8"
    },
  )
  );

  Future<User> getUser() async{
    var r = await dio.get("/user?access_token=a4c4295ab797488f2af325b6d5dc4ea1");
    print(r.data);
    return User.fromJson(r.data);
  }
}