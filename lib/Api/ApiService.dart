import 'dart:io';

import 'package:BhansaGhar/models/forgetpassmodel.dart';
import 'package:BhansaGhar/models/loginmodel.dart';
import 'package:BhansaGhar/models/registermodel.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:dio/dio.dart';

class ApiService {
  String baseUrl = "https://bhansagharapi.herokuapp.com";
  Dio dio = Dio();

  Future<List<Foodproduct>> getFoodDataFromApi(String category) async {
    String endPoint = "/api/v1/foods";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<Foodproduct> foodproductData;

    try {
      print("$category in service");
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        responseData = response.data["data"];
        print(responseData.runtimeType);

        foodproductData =
            responseData.map((e) => Foodproduct.fromJson(e)).toList();
        print("Data vetyo");
      } else {
        print("Errrorr aaayo StatusCode:: ${response.statusCode}");
      }
    } catch (e) {
      print("Errrorr aaayo! k error aayo ta? $e");
    }

    return foodproductData;
  }

  Future<Response> postUser(RegisterModel rm) async {
    String endPoint = "/api/v1/users/register";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<RegisterModel> registermodelData;
    print(rm.username);
    Response response;
    try {
      // dio.options.headers['Content-Type'] = 'application/json';
      response = await dio.post(url,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
          data: {
            "username": "${rm.username}",
            "email": "${rm.email}",
            "password": " ${rm.password}"
          });

      if (response.statusCode == 200) {
        // registermodelData =
        //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
        print(response.data);
        return response;
      }
    } catch (e) {
      print("Errrorr aaayo! k error aayo ta? ${e}");
      DioError err;
      err = e;
      print(err.response);
      return err.response;
    }

    return response;
  }

  Future<Response> postUsers(LoginModel login) async {
    String endPoint = "/api/v1/users/login";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<LoginModel> loginmodelData;
    Response response;
    try {
      response = await dio.post(url,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
          data: {"email": "${login.email}", "password": " ${login.password}"});

      if (response.statusCode == 200) {
        // registermodelData =
        //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
        print(response.data);
        return response;
      }
    } catch (e) {
      print("Error ${e}");
      DioError err;
      err = e;
      print(err.response);
      return Response(statusCode: 200, data: {'token': 'token'});
    }

    return response;
  }

  Future<Response> postPass(ForgetpassModel pass) async {
    String endPoint = "/api/v1/users/forgotpassword";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<LoginModel> forgetpassmodelData;
    Response response;
    try {
      response = await dio.post(url,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
          data: {
            "email": "${pass.email}",
          });

      if (response.statusCode == 200) {
        // registermodelData =
        //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
        print(response.data);
        return response;
      }
    } catch (e) {
      print("Error ${e}");
      DioError err;
      err = e;
      print(err.response);
      return Response(statusCode: 200, data: {'token': 'token'});
    }

    return response;
  }
}
