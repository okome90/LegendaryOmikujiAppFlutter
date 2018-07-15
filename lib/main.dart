import 'package:flutter/material.dart';
import 'omikuji.dart';


void main() => runApp(new LegendaryOmikujiApp());

class LegendaryOmikujiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Legendary Omikuji App',
      home: new OmikujiPage(title: 'LegendaryOmikuji App'),
    );
  }
}
