import 'package:flutter/material.dart';
import 'package:spotifyredesign/model/artists_model.dart';
import 'package:spotifyredesign/view/artist_detail_view.dart';

class ArtistCard extends StatelessWidget {
  final Artists artist;
  const ArtistCard({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArtistDetailView(
                      appBarTitle: artist.name,
                      id: artist.id.toString(),
                    )));
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 16),
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffFCA845), Color(0xffACAFAD)])),
        child: Container(
          width: 130,
          height: 150,
          padding: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(80),
              bottomLeft: Radius.circular(80),
            ),
            image: DecorationImage(
              image: NetworkImage(artist.images[0].url),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            child: Text(
              artist.name,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
