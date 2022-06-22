import 'package:flutter/material.dart';
import 'package:spotifyredesign/model/track_model.dart';
import 'package:spotifyredesign/view/play_view.dart';

class TrackCard extends StatelessWidget {
  final TrackClass track;
  const TrackCard({Key? key, required this.track}) : super(key: key);

  @override
  InkWell build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if (track.previewUrl != null)
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlayView(
                        track: track,
                      )),
            )
          }
      },
      child: Container(
          height: 120,
          margin: EdgeInsets.only(bottom: 15),
          //color: Colors.black.withOpacity(0.3),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(track.album!.images![0].url),
                          fit: BoxFit.cover)),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 10,
                child: Text(track.name!),
              ),
              Expanded(
                flex: 4,
                child: Icon(Icons.favorite_border),
              )
            ],
          )),
    );
  }
}
