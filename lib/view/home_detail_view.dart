import 'package:flutter/material.dart';
import 'package:spotifyredesign/core/constants/padding_theme.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';
import 'package:spotifyredesign/core/widgets/track_card.dart';
import 'package:spotifyredesign/model/track_model.dart';
import 'package:spotifyredesign/services/playlist_services.dart';

class HomeDetailView extends StatefulWidget {
  final String appBarTitle;
  final String id;
  HomeDetailView({Key? key, required this.appBarTitle, required this.id})
      : super(key: key);

  ImageConstants imageConstants = ImageConstants.instance;
  final paddingTheme = PaddingTheme();

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  final PlaylistServices playlistServices = PlaylistServices();
  late final Future<List<Track>> _playlistServices;

  @override
  void initState() {
    super.initState();
    _playlistServices = playlistServices.fetchGetPlaylistTrack(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle)),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: widget.paddingTheme.defaultPadding,
        decoration: ContainerBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: SafeArea(child: TrackCard()),
        // child: ListView(
        //   children: <Widget>[
        //     TrackCard(),
        //     SizedBox(
        //       height: widget.paddingTheme.cardMarginBottom,
        //     ),
        //     TrackCard()
        //   ],
        // ),
        child: SafeArea(
          child: FutureBuilder<List<Track>>(
            future: _playlistServices,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var playlist = snapshot.data;

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var track = playlist![index];
                    return TrackCard(track: track.track!);
                  },
                  itemCount: playlist?.length,
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration ContainerBoxDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(widget.imageConstants.temaBackground),
        fit: BoxFit.cover,
      ),
    );
  }
}
