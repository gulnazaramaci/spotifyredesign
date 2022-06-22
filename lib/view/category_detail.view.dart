import 'package:flutter/material.dart';
import 'package:spotifyredesign/core/color/color_theme.dart';
import 'package:spotifyredesign/core/constants/padding_theme.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';
import 'package:spotifyredesign/core/widgets/playlist_card.dart';
import 'package:spotifyredesign/model/playlist_model.dart';
import 'package:spotifyredesign/services/categories_services.dart';

import '../model/categories_model.dart';

class CategoryDetailView extends StatefulWidget {
  final Categories category;
  CategoryDetailView({Key? key, required this.category}) : super(key: key);

  ImageConstants imageConstants = ImageConstants.instance;
  final paddingTheme = PaddingTheme();
  final colors = ColorTheme();

  @override
  State<CategoryDetailView> createState() => _CategoryDetailViewState();
}

class _CategoryDetailViewState extends State<CategoryDetailView> {
  final CategoriesServices categoriesServices = CategoriesServices();
  late final Future<List<Platlist>> _playlistServices;

  @override
  void initState() {
    super.initState();
    _playlistServices =
        categoriesServices.fetchGetCategoriesPlaylist(id: widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: widget.paddingTheme.defaultPadding,
        decoration: ContainerBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: FutureBuilder<List<Platlist>>(
          future: _playlistServices,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var playlist = snapshot.data;

              return GridView.count(
                crossAxisCount: 2,
                children: playlist!.map((list) {
                  return PlaylistCard(
                    colorLeft: widget.colors.mountainMeadow,
                    colorRight: widget.colors.finlandia,
                    image: NetworkImage(list.images![0].url),
                    text: list.name ?? '',
                    id: list.id!,
                  );
                }).toList(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: const CircularProgressIndicator());
            }
          },
        )),
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
