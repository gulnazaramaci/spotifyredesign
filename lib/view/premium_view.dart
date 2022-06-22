import 'package:flutter/material.dart';

class PremiumView extends StatefulWidget {
  PremiumView({Key? key}) : super(key: key);

  @override
  State<PremiumView> createState() => _PremiumViewState();
}

class _PremiumViewState extends State<PremiumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium'),
      ),
      body: Container(),
    );
  }
}
