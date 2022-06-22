import 'package:dio/dio.dart';
import 'package:spotifyredesign/model/track_model.dart';
import 'package:spotifyredesign/services/login_services.dart';

class PlaylistServices {
  final LoginServices loginServices = LoginServices();

  // Future<Playlist> fetchGetPlaylist({required String id}) async {
  //   final token = await loginServices.getToken();

  //   try {
  //     Playlist _playlist;
  //     final response = await Dio().get(
  //       'https://api.spotify.com/v1/playlists/$id?market=TR',
  //       options: Options(
  //         headers: {'Accept': 'application/json', 'Authorization': token},
  //       ),
  //     );

  //     _playlist = response.data;
  //     print('object');
  //     return _playlist;
  //   } on DioError catch (e) {
  //     return Future.error(e.message);
  //   }
  // }

  Future<List<Track>> fetchGetPlaylistTrack({required String id}) async {
    final token = await loginServices.getToken();

    try {
      List<Track> _playlist = [];
      final response = await Dio().get(
        'https://api.spotify.com/v1/playlists/$id?market=TR',
        options: Options(
          headers: {'Accept': 'application/json', 'Authorization': token},
        ),
      );

      if (response.statusCode == 200) {
        _playlist = (response.data['tracks']['items'] as List)
            .map((e) => Track.fromMap(e))
            .toList();
      }

      return _playlist;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
