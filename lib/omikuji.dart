import 'package:flutter/material.dart';
import 'dart:math' as math;

enum OmikujiResultType {
  great,
  good,
  middle,
  small,
  uncertain,
  bad,
  terrible,
  manji,
}

class OmikujiPage extends StatefulWidget {
  OmikujiPage({Key key, this.title}) : super(key: key);

  final String title;
  String result = "おみくじ";
  
  @override
  _OmikujiPageState createState() => new _OmikujiPageState();
}

class _OmikujiPageState extends State<OmikujiPage> {
  
  void _pressedOmikujiButton() {
    setState(() {
      // omikujiNumberを採番し対応する運勢をラベルに反映する
      OmikujiResultType resultType = getOmikujiResultType();
      widget.result = convertResultTypeToString(resultType);
    });
  }

  OmikujiResultType getOmikujiResultType() {
    int resultIndex = new math.Random().nextInt(OmikujiResultType.values.length);
    return OmikujiResultType.values[resultIndex];
  }

  String convertResultTypeToString(OmikujiResultType resultType) {
    switch (resultType) {
      case OmikujiResultType.great:
        return "大吉";
      case OmikujiResultType.good:
        return "吉";
      case OmikujiResultType.middle:
        return "中吉";
      case OmikujiResultType.small:
        return "小吉";
      case OmikujiResultType.uncertain:
        return "末吉";
      case OmikujiResultType.bad:
        return "凶";
      case OmikujiResultType.terrible:
        return "大凶";
      case OmikujiResultType.manji:
      default:
        return "卍卍卍";
    }
  }

  @override
  Widget build(BuildContext context) {
    
    // 渡し元はMyApp.build
    return new Scaffold(
      // 画面上のバー
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      // レイアウト。単一の子を取り、それを親の中央に配置する
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              widget.result
            ),
          ],
        ),
      ),
      floatingActionButton:  new FloatingActionButton(
        onPressed: _pressedOmikujiButton,
        tooltip: 'Draw Omikuji',
        child: new Icon(Icons.add),
      ),
    );
  }
}