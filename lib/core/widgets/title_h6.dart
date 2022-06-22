import 'package:flutter/material.dart';

class TitleH6 extends StatelessWidget {
  final String title;
  const TitleH6({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
