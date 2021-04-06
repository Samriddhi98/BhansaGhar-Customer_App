import 'dart:io';

import 'package:BhansaGhar/models/chefmodel.dart';
import 'package:BhansaGhar/models/forgetpassmodel.dart';
import 'package:BhansaGhar/models/loginmodel.dart';
import 'package:BhansaGhar/models/registermodel.dart';
import 'package:BhansaGhar/models/userModel.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // String baseUrl = "http://192.168.2.229:5000";
//  String baseUrl = "https://bhansagharapi.herokuapp.com";
  String baseUrl = "http://10.0.2.2:5000";
  Dio dio = Dio();

  String token;

  Future<void> setTokenvalue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    token = pref.getString("token");
    print('token in service $token');
  }

  Future<List<Foodproduct>> getFoodDataFromApi(String category) async {
    String endPoint = "/api/v1/foods";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<Foodproduct> foodproductData;

    try {
      print("$category in service");
      Response response;
      response = await dio.get(url);
      responseData = response.data["data"];

      if (response.statusCode == 200) {
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
    await setTokenvalue();
    print('sign in ma token$token');
    String endPoint = "/api/v1/users/register";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<RegisterModel> registermodelData;
    Response response;
    try {
      // dio.options.headers['Content-Type'] = 'application/json';
      response = await dio.post(url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            "Authorization": "Bearer $token"
          }),
          data: {
            "username": "${rm.username}",
            "email": "${rm.email}",
            "password": "${rm.password}",
          });

      if (response.statusCode == 200) {
        // registermodelData =
        //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
        print(response.data);
        return response;
      }
    } catch (e) {
      print("Error $e");
      DioError err;
      err = e;
      print(err.response);
      return err.response;
    }

    return response;
  }

  Future<UserModel> getUserDetails() async {
    await setTokenvalue();
    print('token in api call $token');
    String endPoint = "/api/v1/users/me";
    String url = baseUrl + endPoint;
    Response response;
    UserModel user;
    try {
      // dio.options.headers['Content-Type'] = 'application/json';
      // print(token);
      response = await dio.get(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "Authorization": "Bearer $token"
        }),
      );

      if (response.statusCode == 200) {
        // registermodelData =
        //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
        print("object");
        print(response.data);
        // chefMap = jsonDecode(response.data);
        user = UserModel.fromJson(response.data["data"]);
        print(user.id);
        return user;
      }
    } catch (e) {
      print("Error $e");
      DioError err;
      err = e;
      print(err.response);
      // return err.response;
    }

    return user;
  }

  // Future<Response> registerUser(RegisterModel rm) async {
  //   String endPoint = "/api/v1/users/register";
  //   String url = baseUrl + endPoint;
  //   List<dynamic> responseData;
  //   List<RegisterModel> registermodelData;
  //   print('sign up password :${rm.password}');

  //   Response response;
  //   try {
  //     dio.options.headers['Content-Type'] = 'application/json';
  //     response = await dio.post(url,
  //         options: Options(
  //             headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
  //         data: {
  //           "username": "${rm.username}",
  //           "email": "${rm.email}",
  //           "password": " ${rm.password}"
  //         });

  //     if (response.statusCode == 200) {
  //       // registermodelData =
  //       //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
  //       print(response.data);
  //       return response;
  //     }
  //   } catch (e) {
  //     print("Errrorr aaayo! k error aayo ta? ${e}");
  //     DioError err;
  //     err = e;
  //     print(err.response);
  //     return err.response;
  //   }

  //   return response;
  // }

  // Future<Response> postUsers(LoginModel login) async {
  //   String endPoint = "/api/v1/users/login";
  //   String url = baseUrl + endPoint;
  //   List<dynamic> responseData;
  //   List<LoginModel> loginmodelData;
  //   Response response;
  //   try {
  //     response = await dio.post(url,
  //         options: Options(
  //             headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
  //         data: {"email": "${login.email}", "password": " ${login.password}"});

  //     if (response.statusCode == 200) {
  //       // registermodelData =
  //       //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
  //       print(response.data);
  //       return response;
  //     }
  //   } catch (e) {
  //     print("Error ${e}");
  //     DioError err;
  //     err = e;
  //     print(err.response);
  //     return Response(statusCode: 200, data: {'token': 'token'});
  //   }

  //   return response;
  // }

  Future<Response> postUserLogin(LoginModel lm) async {
    String endPoint = "/api/v1/users/login";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<RegisterModel> registermodelData;
    Response response;
    try {
      dio.options.headers['Content-Type'] = 'application/json';
      response = await dio.post(url,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
          data: {
            // "username": "${lm.username}",
            "email": "${lm.email}",
            "password": "${lm.password}",
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
      return err.response;
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

  Future<Response> getDetail(String token) async {
    String endPoint = "/api/v1/users/me";
    String url = baseUrl + endPoint;

    Response response;
    try {
      response = await dio.post(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token"
        }),
      );

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

  Future<List<ChefModel>> getChefDetails() async {
    await setTokenvalue();
    print('token in api call in getChefDetails $token');
    String endPoint = "/api/v1/auth/getAllChefs";
    String url = baseUrl + endPoint;
    List<dynamic> responseData;
    List<ChefModel> chefData;
    Response response;

    try {
      response = await dio.get(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "Authorization": "Bearer $token"
        }),
      );
      responseData = response.data["data"];

      if (response.statusCode == 200) {
        chefData = responseData.map((e) => ChefModel.fromJson(e)).toList();

        // chefMap = jsonDecode(response.data);
        // chef = ChefModel.fromJson(response.data["data"]);
        // print(user.id);
        // return user;
      }
    } catch (e) {
      print("Error $e");
      DioError err;
      err = e;
      print(err.response);
      // return err.response;
    }

    return chefData;
  }
}
