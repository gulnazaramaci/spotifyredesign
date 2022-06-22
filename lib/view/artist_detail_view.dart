import 'package:flutter/material.dart';
import 'package:spotifyredesign/core/constants/padding_theme.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';
import 'package:spotifyredesign/core/widgets/track_card.dart';
import 'package:spotifyredesign/model/track_model.dart';
import 'package:spotifyredesign/services/artists_services.dart';

class ArtistDetailView extends StatefulWidget {
  final String appBarTitle;
  final String id;
  ArtistDetailView({Key? key, required this.appBarTitle, required this.id})
      : super(key: key);

  ImageConstants imageConstants = ImageConstants.instance;
  final paddingTheme = PaddingTheme();

  @override
  State<ArtistDetailView> createState() => _ArtistDetailViewState();
}

class _ArtistDetailViewState extends State<ArtistDetailView> {
  final ArtistsServices artistsServices = ArtistsServices();
  late final Future<List<TrackClass>> _playlistServices;

  @override
  void initState() {
    super.initState();
    _playlistServices = artistsServices.fetchGetArtistsTrack(id: widget.id);
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
        child: SafeArea(
          child: FutureBuilder<List<TrackClass>>(
            future: _playlistServices,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var playlist = snapshot.data;

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var track = playlist![index];
                    return TrackCard(track: track);
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
