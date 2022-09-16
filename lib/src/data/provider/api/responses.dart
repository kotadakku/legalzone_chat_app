import 'package:dio/dio.dart';

class Responses<T>{
  int? statusCode;
  String? msg;
  List<T> listObjects = [];
  T? objects;
  int? totalObject;
  int? totalPage;
  dynamic? response;

  Responses({
    int? statusCode,
    String? msg,
    List<T>? listObjects,
    int? totalObject,
    int? totalPage,
    T? objects,
    dynamic? response
  }):
      this.listObjects = listObjects?? [],
      this.objects = objects,
      this.msg = msg,
      this.statusCode = statusCode,
      this.totalObject = totalObject,
      this.totalPage = totalPage,
      this.response = response;
}