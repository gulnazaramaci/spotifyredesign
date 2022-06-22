import 'package:flutter/material.dart';
import 'package:spotifyredesign/model/categories_model.dart';
import 'package:spotifyredesign/view/category_detail.view.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryDetailView(
                    category: category,
                  )),
        );
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
                colors: [Color(0xff9E6CD0), Color(0xffACAFAD)])),
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
              image: NetworkImage(category.icons[0].url!),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            child: Text(
              category.name,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
