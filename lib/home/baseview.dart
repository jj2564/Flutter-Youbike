import 'mapview.dart';

import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {


  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Youbike",
      home: FuckerPage(),
    );
  }
}

class FuckerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapView();
  }
}
