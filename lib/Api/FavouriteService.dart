import 'dart:io';

import 'package:BhansaGhar/providers/favourites.dart';
import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavService {
  // String baseUrl = "https://bhansagharapi.herokuapp.com";
  //String baseUrl = "http://192.168.1.121:5000";
  String baseUrl = "http://10.0.2.2:5000";
  //String baseUrl = "http://172.25.0.174:5000";

  Dio dio = Dio();

  String token;
  String id;

  Future<void> setTokenvalue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    token = pref.getString("token");
  }

  Future<void> setIdValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    id = prefs.getString("UserId");
    print('user $id');
  }

  Future<Response> addToFavourite(String foodId) async {
    await setTokenvalue();
    print('token for add to faavourites $token');
    print('food id: $foodId');
    String endPoint = "/api/v1/favourites/$foodId";
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

  Future<Response> removeFromFavourite(String foodId) async {
    await setTokenvalue();
    print('token for add to faavourites $token');
    print('food id: $foodId');
    String endPoint = "/api/v1/favourites/$foodId";
    String url = baseUrl + endPoint;

    Response response;
    try {
      response = await dio.delete(
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

  Future<List<Favourites>> getFavoriteFood() async {
    await setTokenvalue();
    await setIdValuesSF();
    String endPoint = "/api/v1/favourites/$id";
    String url = baseUrl + endPoint;
    print(token);
    print(id);
    List<dynamic> responseData;
    List<Favourites> foodListData;
    // print(rm.username);
    Response response;
    try {
      //  String fileName = am.photo.split('/').last;
      // dio.options.headers['Content-Type'] = 'application/json';
      // FormData.fromMap({});
      response = await dio.get(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "Authorization": "Bearer $token"
        }),
      );

      if (response.statusCode == 201) {
        responseData = response.data["data"];
        print(responseData.runtimeType);

        foodListData = responseData.map((e) => Favourites.fromJson(e)).toList();
        print('food ko list${foodListData}');
        print("food response");
        print(response.data);

        // List<FoodModel> foodlist = [];
        // Map foodMap = jsonDecode(response.data);
        // food = FoodModel.fromJson(foodMap);
        // foodlist.add(food);
        // List<dynamic> foodlists = response.data["data"];

        // List<Foodproduct> foodlist =
        //     foodlists.map((e) => Foodproduct.fromJson(e)).toList();

        return foodListData;
        // return response;
      }
    } catch (e) {
      print("Errrorr aaayo! k error aayo ta? $e");
      DioError err;
      err = e;
      print(err.response);
      // return err.response;
    }

    return foodListData;
  }
}
