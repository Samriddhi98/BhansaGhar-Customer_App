import 'dart:io';

import 'package:BhansaGhar/models/orderModel.dart';
import 'package:BhansaGhar/providers/cart.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  String baseUrl = "http://10.0.2.2:5000";
  //String baseUrl = "http://172.25.0.174:5000";

  // String baseUrl = "http://192.168.1.121:5000";

  Dio dio = Dio();

  String token;

  Future<void> setTokenvalue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    token = pref.getString("token");
    print('token in service $token');
  }

  Future<Response> addToOrder(
      {String chefId, Cart cart, String location}) async {
    await setTokenvalue();
    print('chef id: $chefId');
    String endPoint = "/api/v1/orders/$chefId";
    String url = baseUrl + endPoint;

    Response response;
    OrderModel order;
    List<Map> listofFood = [];
    cart.items.forEach((k, v) => listofFood.add({
          'foodid': k,
          'quantity': v.quantity,
        }));
    try {
      response = await dio.post(url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "Bearer $token"
          }),
          data: {'food': listofFood, 'location': location});

      if (response.statusCode == 201) {
        print('response in order service${response.data}');
        order = OrderModel.fromJson(response.data["data"]);
        return response;
      }
    } catch (e) {
      print("Error ${e}");
      DioError err;
      err = e;
      print(err.response);
      //  return Response(statusCode: 200, data: {'token': 'token'});
    }

    return response;
  }

  Future<Response> addToOrderCheckout(String orderId, Cart cart) async {
    await setTokenvalue();
    print('order id in service: $orderId');
    String endPoint = "/api/v1/checkout/$orderId";
    String url = baseUrl + endPoint;

    Response response;
    OrderModel order;

    List<Map> listofFood = [];
    cart.items.forEach((k, v) => listofFood.add({
          'foodid': k,
          'quantity': v.quantity,
        }));
    print(listofFood);
    try {
      response = await dio.post(url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "Bearer $token"
          }),
          data: {'food': listofFood});

      if (response.statusCode == 201) {
        // registermodelData =
        //     responseData.map((e) => RegisterModel.fromJson(e)).toList();
        print('response in checkout service${response.data}');

        return response;
      }
    } catch (e) {
      print("Error ${e}");
      DioError err;
      err = e;
      print(err.response);
      //  return Response(statusCode: 200, data: {'token': 'token'});
    }

    return response;
  }
}
