import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spotifyredesign/model/categories_model.dart';
import 'package:spotifyredesign/model/playlist_model.dart';
import 'package:spotifyredesign/services/login_services.dart';

class CategoriesServices {
  final LoginServices loginServices = LoginServices();
  Future<List<Categories>> fetchGetCategories() async {
    final token = await loginServices.getToken();
    try {
      List<Categories> _categoriesList = [];
      final response = await Dio().get(
        'https://api.spotify.com/v1/browse/categories',
        options: Options(
          headers: {'Accept': 'application/json', 'Authorization': token},
        ),
      );

      if (response.statusCode == 200) {
        _categoriesList = (response.data['categories']['items'] as List)
            .map((e) => Categories.fromMap(e))
            .toList();
      }

      return _categoriesList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<List<Platlist>> fetchGetCategoriesPlaylist(
      {required String id}) async {
    final token = await loginServices.getToken();
    try {
      List<Platlist> _categoriesPlayList = [];
      final response = await Dio().get(
        'https://api.spotify.com/v1/browse/categories/$id/playlists',
        options: Options(
          headers: {'Accept': 'application/json', 'Authorization': token},
        ),
      );
      // late final data = response.data['playlists']['items'];
      // print('$data');

      if (response.statusCode == 200) {
        _categoriesPlayList = (response.data['playlists']['items'] as List)
            .map((e) => Platlist.fromMap(e))
            .toList();
      }

      return _categoriesPlayList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
