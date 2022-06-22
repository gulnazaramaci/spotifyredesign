import 'package:dio/dio.dart';
import 'package:spotifyredesign/model/artists_model.dart';
import 'package:spotifyredesign/model/track_model.dart';
import 'package:spotifyredesign/services/login_services.dart';

class ArtistsServices {
  final LoginServices loginServices = LoginServices();
  Future<List<Artists>> fetchGetArtists() async {
    final token = await loginServices.getToken();
    try {
      List<Artists> _artistsList = [];
      final response = await Dio().get(
        'https://api.spotify.com/v1/artists',
        queryParameters: {
          'ids':
              '6LnJKrtFnTEGdbWQ2riWCL,64d1rUxfizSAOE9UbMnUZd,5IAxUWLiTMsvc1oWPrczNj,15AZJFNrXtIN4Nk8BIOnS2,5cj0lLjcoR7YOSnhnX0Po5,2u4xMsh0M2B7R8Wb3pEWae,4i4ALRtQQmFxn3BCIB6iC0'
        },
        options: Options(
          headers: {'Accept': 'application/json', 'Authorization': token},
        ),
      );
      if (response.statusCode == 200) {
        _artistsList = (response.data['artists'] as List)
            .map((e) => Artists.fromMap(e))
            .toList();
      }
      return _artistsList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<List<TrackClass>> fetchGetArtistsTrack({required String id}) async {
    final token = await loginServices.getToken();
    try {
      List<TrackClass> _artistsTrackList = [];

      final response = await Dio().get(
        'https://api.spotify.com/v1/artists/$id/top-tracks?market=TR',
        options: Options(
          headers: {'Accept': 'application/json', 'Authorization': token},
        ),
      );

      // final data = response.data;
      // print('$data');

      if (response.statusCode == 200) {
        _artistsTrackList = (response.data['tracks'] as List)
            .map((e) => TrackClass.fromMap(e))
            .toList();
      }
      return _artistsTrackList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
