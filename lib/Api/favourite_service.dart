import 'dart:io';

import 'package:BhansaGhar/providers/foodproduct.dart';
import 'package:dio/dio.dart';


class FavService{
    String baseUrl = "https://bhansagharapi.herokuapp.com";
  Dio dio = Dio();
  
  Future<List<Foodproduct>> addToFavourite(String id) async {

  }
}