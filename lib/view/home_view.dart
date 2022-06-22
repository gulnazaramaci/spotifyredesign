import 'package:flutter/material.dart';
import 'package:spotifyredesign/core/color/color_theme.dart';
import 'package:spotifyredesign/core/constants/constants.dart';
import 'package:spotifyredesign/core/constants/padding_theme.dart';
import 'package:spotifyredesign/core/enum/home_card_enum.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';
import 'package:spotifyredesign/core/widgets/artist_card.dart';
import 'package:spotifyredesign/core/widgets/category_card.dart';
import 'package:spotifyredesign/core/widgets/home_card.dart';
import 'package:spotifyredesign/core/widgets/title_h6.dart';
import 'package:spotifyredesign/model/artists_model.dart';
import 'package:spotifyredesign/model/categories_model.dart';
import 'package:spotifyredesign/services/artists_services.dart';
import 'package:spotifyredesign/services/categories_services.dart';
import 'package:spotifyredesign/core/widgets/tag.dart';
import 'package:spotifyredesign/view/login_view.dart';
import 'package:spotifyredesign/view/settings_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  final paddingTheme = PaddingTheme();
  final constants = Constants();
  final colors = ColorTheme();
  ImageConstants imageConstants = ImageConstants.instance;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CategoriesServices categoriesServices = CategoriesServices();
  late final Future<List<Categories>> _categoriesList;

  final ArtistsServices artistsServices = ArtistsServices();
  late final Future<List<Artists>> _artistsList;

  @override
  void initState() {
    super.initState();
    _categoriesList = categoriesServices.fetchGetCategories();
    _artistsList = artistsServices.fetchGetArtists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        padding: widget.paddingTheme.defaultPadding,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 150),
          children: <Widget>[
            Row(
              children: [
                Tag(
                  text: widget.constants.music,
                  color: widget.colors.silverChalice,
                  bgColor: widget.colors.mineShaft,
                ),
                Tag(
                  text: widget.constants.podcastsShows,
                  color: widget.colors.silverChalice,
                  bgColor: widget.colors.mineShaft,
                ),
              ],
            ),
            SizedBox(
              height: widget.paddingTheme.sizeBoxBottomContainer,
            ),
            HomeListWidget(),
            SizedBox(
              height: widget.paddingTheme.sizeBoxBottomContainer,
            ),
            TitleH6(title: widget.constants.artists),
            SizedBox(
              height: widget.paddingTheme.sizeBoxBottomTitle,
            ),
            ArtistsListWidget(),
            SizedBox(
              height: widget.paddingTheme.sizeBoxBottomContainer,
            ),
            TitleH6(title: widget.constants.categories),
            SizedBox(
              height: widget.paddingTheme.sizeBoxBottomTitle,
            ),
            CategoriesListWidget(),
          ],
        ),
      ),
    );
  }

  Container HomeListWidget() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              HomeCard(
                colorLeft: widget.colors.violetRed,
                colorRight: widget.colors.finlandia,
                image: AssetImage(widget.imageConstants.image1),
                text: widget.constants.moodBooster,
                id: '37i9dQZF1EVJSvZp5AOML2',
              ),
              SizedBox(
                width: widget.paddingTheme.sizeBoxBottomTitle,
              ),
              HomeCard(
                colorLeft: widget.colors.cornflowerBlue,
                colorRight: widget.colors.finlandia,
                image: AssetImage(widget.imageConstants.image2),
                text: widget.constants.dailyLift,
                id: '37i9dQZF1DX3YSRoSdA634',
              ),
            ],
          ),
          SizedBox(
            height: widget.paddingTheme.sizeBoxBottomTitle,
          ),
          Row(
            children: [
              HomeCard(
                colorLeft: widget.colors.boulder,
                colorRight: widget.colors.edward,
                image: AssetImage(widget.imageConstants.image3),
                text: widget.constants.toxic,
                id: '37i9dQZF1EVKuMoAJjoTIw',
              ),
              SizedBox(
                width: widget.paddingTheme.sizeBoxBottomTitle,
              ),
              HomeCard(
                colorLeft: widget.colors.yellowOrange,
                colorRight: widget.colors.finlandia,
                image: AssetImage(widget.imageConstants.image4),
                text: widget.constants.melody,
                id: '37i9dQZF1DX9ASuQophyb3',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container ArtistsListWidget() {
    return Container(
      height: 150,
      child: FutureBuilder<List<Artists>>(
        future: _artistsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var artistsList = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var artist = artistsList[index];
                return ArtistCard(artist: artist);
              },
              itemCount: artistsList.length,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Container CategoriesListWidget() {
    return Container(
      height: 150,
      child: FutureBuilder<List<Categories>>(
        future: _categoriesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categoriesList = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var category = categoriesList[index];
                return CategoryCard(category: category);
              },
              itemCount: categoriesList.length,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }

  AppBar AppBarWidget() {
    return AppBar(
      title: Text(
        widget.constants.goodMorning,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
      ),
      actions: <Widget>[
        Padding(
          padding: widget.paddingTheme.appBarButtonPadding,
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.notifications_none_sharp,
              size: 26.0,
            ),
          ),
        ),
        Padding(
          padding: widget.paddingTheme.appBarButtonPadding,
          child: GestureDetector(
            onTap: () {},
            child: Icon(Icons.watch_later_outlined),
          ),
        ),
        Padding(
          padding: widget.paddingTheme.appBarButtonPadding,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginView()));
            },
            child: Icon(Icons.exit_to_app),
          ),
        ),
      ],
    );
  }
}
