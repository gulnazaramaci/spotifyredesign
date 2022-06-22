import 'package:flutter/material.dart';
import 'package:spotifyredesign/view/home_detail_view.dart';

class PlaylistCard extends StatelessWidget {
  final Color colorLeft;
  final Color colorRight;
  final NetworkImage image;
  final String text;
  final String id;
  const PlaylistCard(
      {Key? key,
      required this.colorLeft,
      required this.colorRight,
      required this.image,
      required this.text,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 5.0, bottom: 5.0, top: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailView(
                        appBarTitle: text,
                        id: id,
                      )));
        },
        child: Container(
          height: 87,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [colorLeft, colorRight]),
            image: DecorationImage(
              image: image,
              alignment: Alignment.topRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              // child: Text(
              //   text,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 16,
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
